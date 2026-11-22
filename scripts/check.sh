#!/usr/bin/env bash
# =============================================================================
# mfmx-project-conventions — Repo bütünlük testi (scripts/check.sh)
#
# NE YAPAR: Bu reponun şablonlarının ve kurallarının birbiriyle tutarlı ve
#           çalışır olduğunu doğrular: linkler, Makefile, make install, git
#           hook'ları, şablon notu, geçmişte gizli dosya ve etiket türü.
# KULLANIM: bash scripts/check.sh      (çıkış kodu 0 = tüm testler geçti)
#           GitHub Actions her PR'da ve main'e her push'ta çalıştırır.
# GÜVENLİ : Repoyu değiştirmez; testleri geçici bir klasördeki kopyalarda yapar
#           ve çıkışta o klasörü siler.
# GEREKSİNİM: bash, git, GNU make, python3 + PyYAML (python3-yaml).
#
# Not: Bu script bu reponun kendi testidir; şablon olarak kopyalanmaz.
# =============================================================================
set -u
export LC_ALL=C

REPO="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
cd "$REPO" || exit 1

pass=0; fail=0
ok(){ printf '  PASS  %s\n' "$1"; pass=$((pass+1)); }
ko(){ printf '  FAIL  %s\n' "$1"; fail=$((fail+1)); }

# Git kimliği: CI'da tanımlı olmayabilir, test commitleri için geçici kullanılır.
GITC=(git -c user.name=check -c user.email=check@example.invalid -c commit.gpgsign=false)

echo "== 1. Linkler (kod blokları hariç)"
if python3 - <<'PY'
import glob, os, re, sys
bad = []
for f in glob.glob('**/*.md', recursive=True):
    t = open(f, encoding='utf-8').read()
    t = re.sub(r'```.*?```', '', t, flags=re.S)
    t = re.sub(r'``.*?``|`[^`]*`', '', t)
    for m in re.finditer(r'\]\((\.{1,2}/[^)#\s]+)', t):
        if not os.path.exists(os.path.normpath(os.path.join(os.path.dirname(f), m.group(1)))):
            bad.append((f, m.group(1)))
for b in bad:
    print('        kırık:', b[0], '->', b[1])
sys.exit(1 if bad else 0)
PY
then ok "kırık link yok"; else ko "kırık link var"; fi

echo "== 2. Makefile ve YAML"
if timeout 20 make >/dev/null 2>&1; then ok "make (yardım menüsü)"; else ko "make"; fi
if python3 -c "import yaml; yaml.safe_load(open('config.example.yaml'))" 2>/dev/null; then ok "config.example.yaml geçerli YAML"; else ko "config.example.yaml geçersiz veya PyYAML yok"; fi
if grep -qE '^ +[^ ]' Makefile; then ko "Makefile'da boşlukla başlayan satır (tarifler TAB ile başlamalı)"; else ok "Makefile'da boşlukla başlayan satır yok"; fi

echo "== 3. make install (geçici kopyalarda)"
T="$TMP/full"; mkdir -p "$T"
git ls-files -z | xargs -0 -I{} cp --parents {} "$T"/
if ( cd "$T" && timeout 20 make install >/dev/null 2>&1 ) && [ -f "$T/config.yaml" ] && [ -f "$T/.env" ] && [ -f "$T/docs/NOTES.local.md" ]; then
    ok "tam kopya: config.yaml, .env, docs/NOTES.local.md oluştu"
else
    ko "tam kopya: make install beklenen dosyaları oluşturmadı"
fi
if ( cd "$T" && git init -q && git add -A && git diff --cached --name-only | grep -qE '(^|/)(\.env|config\.yaml|NOTES\.local\.md)$' ); then
    ko "gerçek dosyalardan biri git'e girdi (.gitignore eksik)"
else
    ok "gerçek dosyalar (.env, config.yaml, NOTES.local.md) git'e girmiyor"
fi
echo "GERCEK" > "$T/config.yaml"; echo "SECRET=1" > "$T/.env"
( cd "$T" && timeout 20 make install >/dev/null 2>&1 )
if [ "$(cat "$T/config.yaml")" = "GERCEK" ] && [ "$(cat "$T/.env")" = "SECRET=1" ]; then ok "var olan dosyaların üstüne yazılmadı"; else ko "make install var olan dosyanın üstüne yazdı"; fi
T="$TMP/makefile-only"; mkdir -p "$T"; cp Makefile "$T"/
if ( cd "$T" && timeout 20 make install >/dev/null 2>&1 ); then ok "sadece Makefile kopyalanınca install hatasız"; else ko "sadece Makefile kopyalanınca install çöktü"; fi

echo "== 4. Pre-commit hook (PRE_COMMIT_CHECKLIST.md içindeki betik)"
H="$TMP/pre-commit"
sed -n '/#!\/usr\/bin\/env bash/,/^```$/p' docs/standards/PRE_COMMIT_CHECKLIST.md | sed '$d' > "$H"
if bash -n "$H"; then ok "hook sözdizimi"; else ko "hook sözdizimi"; fi
T="$TMP/hook"; mkdir -p "$T"
(
  cd "$T" && git init -q && cp "$H" .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit && cp "$REPO/.gitignore" .
  C(){ "${GITC[@]}" commit -qm "$1" >/dev/null 2>&1; }
  cp -r "$REPO/docs" . && git add . && { C a && echo P1 || echo F1; }
  echo x > docs/NOTES.local.md; git add -f docs/NOTES.local.md; { C b && echo F2 || echo P2; }; git reset -q
  # Sahte secret çalışma anında birleştirilir; bu dosyanın kendisi hook'a takılmasın diye düz metin tutulmaz.
  printf '%s = "%s"\n' "API_""KEY" "sk_live_""abcdefghijklmnop1234" > a.py; git add a.py; { C c && echo F3 || echo P3; }
) > "$TMP/hook.out" 2>&1
if grep -q P1 "$TMP/hook.out"; then ok "repo belgeleri commit'lenebiliyor"; else ko "repo belgeleri hook'a takıldı"; fi
if grep -q P2 "$TMP/hook.out"; then ok "git add -f ile docs/NOTES.local.md engellendi"; else ko "docs/NOTES.local.md engellenmedi"; fi
if grep -q P3 "$TMP/hook.out"; then ok "secret engellendi"; else ko "secret engellenmedi"; fi

echo "== 5. Pre-push hook (PRE_PUSH_CHECKLIST.md içindeki betik)"
P="$TMP/pre-push"
sed -n '/## 8\./,$p' docs/standards/PRE_PUSH_CHECKLIST.md | sed -n '/#!\/usr\/bin\/env bash/,/^```$/p' | sed '$d' > "$P"
Z=0000000000000000000000000000000000000000
if ( cd "$TMP" && echo "refs/heads/f a refs/heads/main $Z" | bash "$P" >/dev/null 2>&1 ); then ok "solo main push serbest"; else ko "solo main push engellendi"; fi
if ( cd "$TMP" && echo "refs/heads/f a refs/heads/main $Z" | PROTECTED_BRANCHES=main bash "$P" >/dev/null 2>&1 ); then ko "korumalı dala push geçti"; else ok "korumalı dala push engellendi"; fi

echo "== 6. Şablon notu, geçmiş, etiketler"
miss=""
for f in CHANGELOG.md config.example.yaml .env.example .gitignore Makefile docs/*.md docs/ASKED/_SABLON.md docs/standards/*.md; do
    grep -q 'Şablon: https' "$f" || miss="$miss $f"
done
if [ -z "$miss" ]; then ok "şablon notu tüm şablonlarda"; else ko "şablon notu eksik:$miss"; fi
leak="$(git log --all --name-only --format= | grep -E '\.local(\.|$)' | grep -v '\.example\.' || true)"
if [ -z "$leak" ]; then ok "geçmişte gizli (*.local) dosya yok"; else ko "geçmişte gizli dosya: $leak"; fi
light=""
for t in $(git tag); do [ "$(git cat-file -t "$t")" = tag ] || light="$light $t"; done
if [ -z "$light" ]; then ok "tüm etiketler annotated"; else ko "lightweight etiket:$light"; fi

echo "== SONUÇ: $pass PASS, $fail FAIL"
[ "$fail" -eq 0 ]
