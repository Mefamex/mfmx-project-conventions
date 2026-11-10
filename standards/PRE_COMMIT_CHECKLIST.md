# Pre-Commit Checklist (Commit Öncesi Kontrol Listesi)

> **Temel İlke:** "Lokal commit serbesttir; ancak kirli, sızdıran ve test edilmemiş kod yerel depoya dahi mühürlenemez."  
> Bu kontrol listesi; geliştiricilerin ve yapay zekâ kodlama ajanlarının (Antigravity, Claude Code, Cursor vb.) `git commit` komutunu çalıştırmadan önce geçmesi gereken **en erken ve en ucuz güvenlik kapısıdır (shift-left gate)**.  
> Bu aşamadaki kontroller hızlı olmalıdır (hedef: < 15 saniye).

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Sıfır Sızıntı Güvenlik Kapısı (Secret & Credential Gate)
*Depo geçmişine bir kez giren bir anahtar, sonraki commit'te silinse dahi git geçmişinde sonsuza dek yaşar.*

- [ ] **Hardcoded Gizli Değer Yok:** Kaynak kodda, test mock'larında veya yorum satırlarında API key, token, şifre veya özel anahtar (private key) bulunmuyor.
- [ ] **İstemci Tarafı Env Tuzakları:** Frontend projelerinde `NEXT_PUBLIC_`, `VITE_`, `REACT_APP_` gibi istemciye açık öneklerde hassas backend anahtarları yer almıyor.
- [ ] **Gerçek Yapılandırma Dosyaları İhmal Edildi:** `.env`, `.env.local`, `service-account.json`, `*.pem`, `*.key` dosyaları `.gitignore` içinde yer alıyor. Depoya yalnızca `.env.example` gibi sahte şablonlar ekleniyor.
- [ ] **Büyük ve İkili Dosya Engeli:** Depoya yanlışlıkla eklenmiş veri seti (`.csv`, `.sqlite`), model ağırlığı (`.bin`, `.onnx`), arşiv (`.zip`) veya derleme çıktısı (`dist/`, `build/`) yok.

---

## 2. Staging ve Kapsam Hijyeni (Diff & Scope Gate)
*Körlemesine `git add .` çalıştırmak yasaktır. Yalnızca hedeflenen değişiklikler sahnelenmelidir.*

- [ ] **`git diff --staged` Bizzat İncelendi:** Sahneye (staging area) alınan her dosya ve satır tek tek okundu.
- [ ] **Kapsam Aşımı (Scope Creep) Yok:** Yalnızca görevin gerektirdiği dosyalar değiştirildi. "Hazır buradayken şunu da düzelteyim" denilerek yapılan alakasız refaktörler veya dosya yeniden adlandırmaları yok.
- [ ] **Hata Ayıklama Artıkları Temizlendi:** Geçici `console.log`, `print()`, `dump()`, yorum satırına alınmış ölü kod blokları ve sahte test printleri temizlendi.
- [ ] **İzinsiz Bağımlılık Eklenmedi:** Gerekli olmadıkça `package.json`, `requirements.txt` veya `go.mod` dosyalarına yeni kütüphane eklenmedi. Eklenen kütüphanelerin lisansı projeyle uyumlu.

---

## 3. Yapay Zekâ (AI) Ajanı Özel Tuzakları
*AI kodlama ajanlarının en sık düştüğü kritik hataları filtreler:*

- [ ] **Sahte Yeşil Test Hilesi Yok:** Ajan, testleri yeşile çevirmek için başarısız olan bir birim testini **silmedi, yorum satırına almadı veya `@pytest.mark.skip` / `test.skip()` ile devre dışı bırakmadı**.
- [ ] **Değişiklik İzahı Net:** Yapılan değişiklik ve mimari etki tek veya iki net cümleyle gerekçelendirilebiliyor.
- [ ] **Yetki ve Çoklu Kiracılık (Multi-Tenancy) Korundu:** Yeni veya değişen API uçlarında yetkilendirme kontrolü atlanmadı; veri sorguları çağıran kullanıcının veya organizasyonun yetki sınırına kilitlendi.
- [ ] **Var Olan Kodlama Kalıpları Bozulmadı:** Projede kurulu olan mimari desen terk edilip ajan tarafından yeni bir yöntem icat edilmedi.

---

## 4. Hızlı Doğrulama ve Sözdizimi (Fast Checks)
*Pre-commit aşamasında tüm entegrasyon testlerini çalıştırmak geliştiriciyi yavaşlatır; yalnızca hızlı statik kontroller çalıştırılır.*

- [ ] **Sözdizimi ve Lint Temiz:** `make lint` veya ilgili dilin hızlı linter'ı (Ruff, ESLint, Clippy, Go Vet) sıfır hatayla geçti.
- [ ] **Biçimlendirme (Formatting) Standart:** Kod biçimlendirici (Prettier, Black, Rustfmt, Gofmt) çalıştırıldı; stil farklılıkları diff'i kirletmiyor.
- [ ] **Hafif Tip Denetimi:** Varsa hızlı statik tip kontrolü (`tsc --noEmit`, `mypy --quick`) çalıştırıldı.

---

## 5. Commit Mesaj Standardı (Conventional Commits)
*[GIT_STANDARDS.md](./GIT_STANDARDS.md) kurallarına tam uyum:*

- [ ] **Standart Format:** `<type>(<scope>): <açıklama>` sözdizimi kullanıldı.
- [ ] **Kabul Edilen Tip:** `feat`, `fix`, `add`, `update`, `refactor`, `perf`, `docs`, `test`, `chore`, `build` tiplerinden biri seçildi.
- [ ] **Emir Kipi ve Küçük Harf:** "added", "fixed" yerine "add", "fix" kullanıldı; tip ve kapsam küçük harfle yazıldı.
- [ ] **Noktasız Bitiş ve Karakter Sınırı:** Başlık satırının sonuna nokta konmadı; 72 karakter sınırı aşılmadı.
- [ ] **Tembel Mesaj Yasak:** Tipsiz ve tek kelimelik "wip", "update", "fixes", "changes" gibi muğlak commit başlıkları kullanılmadı.

---

## 6. Hızlı Doğrulama Komut Seti

Commit atmadan önce terminalinizde şu sırayla çalıştırın:

```bash
# 1. Sahnelenen değişiklikleri satır satır inceleyin
git diff --staged

# 2. Hassas anahtar ve token taraması (gitleaks kuruluysa; eski sürümlerde: gitleaks protect --staged)
gitleaks git --pre-commit --staged --redact --verbose

# 3. Hızlı lint ve biçim denetimi
make lint

# 4. Atomik commit oluşturma (Conventional Commits)
git commit -m "feat(auth): add rate limiting middleware for login endpoint"
```

---

## 7. Örnek Git Pre-Commit Kancası (.git/hooks/pre-commit)

Bu kontrolleri otomatikleştirmek için projenizin `.git/hooks/pre-commit` dosyasına şu betiği kaydedip çalıştırılabilir yapabilirsiniz (`chmod +x .git/hooks/pre-commit`).  
Betik yalnızca **eklenen satırları** (`+`) tarar; silinen satırlar ve belge içinde geçen "api_key" gibi kelimeler alarm vermez. Gerçek bir değer atanmışsa (16+ karakter) veya özel anahtar bloğu varsa commit durdurulur.

```bash
#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C   # Türkçe locale'de grep -i "I/ı" eşleşmesini bozar; regex'leri C locale'de çalıştır

echo "==> [Pre-Commit] Kontroller başlatılıyor..."

# Yalnızca sahnelenen değişikliklerde EKLENEN satırlar (dosya başlıkları hariç)
added="$(git diff --cached -U0 --no-color | grep -E '^\+' | grep -vE '^\+\+\+' || true)"

# 1. Gizli anahtar/token kontrolü: gitleaks varsa onu, yoksa basit regex'i kullan
if command -v gitleaks >/dev/null 2>&1; then
    gitleaks git --pre-commit --staged --redact --no-banner
elif grep -Eiq \
    -e "(api[_-]?key|secret[_-]?key|access[_-]?key|private[_-]?key|aws_secret|password|token)[\"']?[[:space:]]*[:=][[:space:]]*[\"']?[A-Za-z0-9/+._-]{16,}" \
    -e "-----BEGIN [A-Z ]*PRIVATE KEY-----" <<<"$added"; then
    echo "HATA: Sahnelenen değişikliklerde olası gizli anahtar tespit edildi!"
    echo "Lütfen 'git diff --staged' komutunu inceleyin."
    exit 1
fi

# 2. Debug artıkları (yalnızca uyarı; commit'i durdurmaz)
if grep -Eq "(console\.log\(|debugger;|breakpoint\(\)|binding\.pry|dd\()" <<<"$added"; then
    echo "UYARI: Sahnelenen değişikliklerde debug ifadeleri var. Bilinçli değilse temizleyin."
fi

# 3. Hızlı lint denetimi (Makefile'da lint hedefi varsa)
if [ -f Makefile ] && grep -q "^lint:" Makefile; then
    make lint
fi

echo "==> [Pre-Commit] Tüm kontroller temiz. Commit oluşturuluyor."
```
