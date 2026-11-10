# Pre-Push Checklist (Push Öncesi Kontrol Listesi)

> **Temel İlke:** "Commit serbesttir; ancak `git push` kesinlikle kullanıcı iznine ve eksiksiz doğrulamaya tabidir."  
> Bu kontrol listesi; geliştiricilerin ve yapay zekâ kodlama ajanlarının (Antigravity, Claude Code, Cursor vb.) yerel commitleri uzak depoya (remote) göndermeden önce tamamlaması gereken **nihai doğrulama ve emniyet kapısıdır**.  
> Uzak depoya gönderilen her hatalı commit; CI/CD kaynaklarını tüketir, bulut faturalarını şişirir ve paylaşılan dallarda çalışan tüm ekibin akışını kesintiye uğratır.

---

## 1. Altın Kural: Kullanıcı Onayı ve Gatekeeping
*Yapay zekâ ajanları ve otonom süreçler için değişmez güvenlik kuralıdır:*

- [ ] **Kullanıcı Onayı Alındı:** **Hiçbir AI ajanı açık kullanıcı onayı almadan `git push` çalıştıramaz.** Kullanıcıya yapılacak push'un kapsamı ve dal adı bildirilip açık onay ("Push edebilirsin") istendi.
- [ ] **Hedef Dal Bildirildi:** Push edilecek dal (`main` dahil) kullanıcıya açıkça söylendi. Ekip projelerinde korumalı dallara (`main`, `production`, `release/*`) doğrudan push yerine özellik dalı + PR / MR kullanılır; tek kişilik projelerde onaylı `main` push serbesttir.

---

## 2. Dal ve Çalışma Alanı Senkronizasyonu (Branch & Stash Hygiene)
*"Localimde çalışıyordu ama CI'da patladı" felaketlerini önler:*

- [ ] **Doğru Dal Doğrulandı:** `git branch --show-current` çıktısı hedeflenen geliştirme dalını işaret ediyor.
- [ ] **Çalışma Ağacı Tertemiz:** `git status` çıktısında unutulmuş, sahnelenmemiş veya `untracked` bırakılmış kritik dosya yok. Kodun çalışması için gereken tüm yeni dosyalar commit edildi.
- [ ] **Uzak Dal İle Senkron:** `git fetch origin` yapıldı; yerel dal uzak dalın gerisinde kalmadı. Olası çakışmalar (merge conflicts) uzak depoya basılmadan önce yerelde çözüldü.

---

## 3. Derin Doğrulama ve CI Eşitliği (Full Verification Suite)
*Pre-push aşaması yalnızca hızlı linting ile yetinmez; CI ortamında çalışacak tüm aşamaları yerelde simüle eder:*

- [ ] **Tüm Birim ve Entegrasyon Testleri Başarılı:** `make test` sıfır hatayla geçti (tüm testler passed, exit code 0).
- [ ] **Statik Tip Denetimi Temiz:** `tsc --noEmit`, `mypy .`, `cargo check` gibi derin tip kontrolleri sıfır hata verdi.
- [ ] **Üretim Derlemesi (Build) Başarılı:** `make build` (veya `npm run build`, `go build`, `cargo build --release`) hatasız tamamlandı; derleme hatası veya eksik paket kalıntısı yok.
- [ ] **Canlı Çalışma Doğrulaması (Smoke Test):** Uygulama yerelde ayağa kalkıyor mu? Temel uç nokta veya CLI komutu beklendiği gibi yanıt veriyor mu?

---

## 4. Git Geçmişi ve Commit Hijyeni (History Sanity)
*Uzak depoya basılacak commit geçmişinin temiz ve okunabilir olması gerekir:*

- [ ] **Gönderilecek Commitler İncelendi:** `git log origin/<hedef-dal>..HEAD --stat` veya `git log --oneline -n 5` ile sadece gönderilmek istenen commitlerin listede olduğu doğrulandı.
- [ ] **Geçici ve Tembel Commitler Ayıklandı:** Geliştirme esnasında atılmış "wip", "deneme", "fix typo", "temp" gibi dağınık commitler varsa `git rebase -i` ile squash edilip temizlendi.
- [ ] **Tarihsel Sızıntı Kontrolü:** Önceki bir commit'te yanlışlıkla eklenip bir sonraki commit'te silinmiş gizli bir anahtar (secret/token) yok. (Varsa git geçmişi temizlenmeden push yapılamaz).

---

## 5. Yıkıcı Eylem Koruması (Force Push Safeguards)
*Ekip çalışmasını ve üretim dallarını yok eden tehlikeli parametrelerin engellenmesi:*

- [ ] **`--force` Kesinlikle Yasak:** Açık ve acil bir felaket kurtarma talimatı olmadıkça `git push --force` veya `-f` kullanılmıyor.
- [ ] **İstisnai Rebase Durumu:** Yalnızca tek kişinin çalıştığı özel özellik dalında rebase sonrası geçmiş güncelleniyorsa, körlemesine `--force` yerine mutlaka `--force-with-lease` kullanılıyor.

---

## 6. MFMX Proje Standartları Uyumu (Repo Conventions Compliance)
*Proje, [MFMX Project Conventions](https://github.com/Mefamex/mfmx-project-conventions) deposunda tanımlanan tüm mimari kurallara ve dosya standartlarına tam uyum sağlamalıdır:*

- [ ] **Merkezi Standart Deposu Denetlendi:** [https://github.com/Mefamex/mfmx-project-conventions](https://github.com/Mefamex/mfmx-project-conventions) deposundaki tüm çekirdek dosya kuralları incelendi; projenin bu kuralların hiçbirini ihlal etmediği teyit edildi.
- [ ] **TODO & DONE Çapası:** [`TODO.md`](../TODO.md) başındaki Context Anchor (Bağlam Çapası) güncel; tamamlanan görevler doğrulama komutu/test kanıtı (exit code 0) ile [`docs/TODO.DONE.md`](../docs/TODO.DONE.md)'ye ters kronolojik olarak aktarıldı.
- [ ] **Mühendislik Belleği (`NOTES.md`):** Karşılaşılan kritik platform tuzakları, ölçülmüş sistem limitleri veya elenen alternatifler [`NOTES.md`](../NOTES.md) içine diske sabitlendi.
- [ ] **Soru ve Karar Kuyruğu (`ASK.md`):** Açık mimari ikilemler veya ajanın otonom aldığı tercihler (`Kendi Kararım`) [`ASK.md`](../ASK.md) dosyasına gerekçeleriyle kaydedildi; tahminle koda girilmedi. Cevaplanan sorular `docs/ASKED/<konu>.md` dosyasına işlendi, Karara Bağlananlar listesi güncel ve cevaplananlar `ASK.md`'den kaldırıldı.
- [ ] **Kaskad Yapılandırma (`config.yaml`):** Sıfır gizli anahtar (secret/token) kuralına uyuldu; birimli isimlendirme (`timeout_sec` vb.) ve ENV > config.yaml > varsayılan hiyerarşisi korundu.
- [ ] **Standart Makefile:** 6 zorunlu yaşam döngüsü hedefi (`install`, `reinstall`, `update`, `run`, `clean`, `remove`) tanımlı ve tek başına `make` yazıldığında yardım menüsü dökülüyor.
- [ ] **Git & README Standartları:** [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) (Conventional Commits, atomik commit) ve [`README.STANDARDS.md`](./README.STANDARDS.md) (meta tablosu, başlık sırası) kurallarına eksiksiz uyuldu.
- [ ] **Yapı Haritası (`docs/STRUCTURE.md`):** Klasör eklendiyse, silindiyse veya adı değiştiyse [`docs/STRUCTURE.md`](../docs/STRUCTURE.md) aynı commit'te güncellendi; README'deki Proje Yapısı (Ana Dizin) bölümü kökteki değişikliği yansıtıyor.
- [ ] **Dokümantasyon Güncelliği:** Eklenen yeni parametreler, API rotaları veya ortam değişkenleri [`README.md`](../README.md) içine yansıtıldı; kullanıcıyı etkileyen değişiklikler [`CHANGELOG.md`](../CHANGELOG.md) dosyasının en üstüne özetlendi.

---

## 7. Push Öncesi Standart Komut Seti

Push komutunu vermeden önce terminalinizde sırayla şu adımları izleyin:

```bash
# 1. Çalışma ağacının temiz olduğunu doğrulayın
git status

# 2. Gönderilecek commit listesini ve değişen dosyaları görün
git log @{upstream}..HEAD --stat    # upstream yoksa: git log --oneline -n 10

# 3. Derin doğrulama ve test paketini yerelde çalıştırın
make verify    # veya make test && make build

# 4. KULLANICI ONAYI ALINDIKTAN SONRA güvenli push çalıştırın
git push origin $(git branch --show-current)
```

---

## 8. Örnek Git Pre-Push Kancası (.git/hooks/pre-push)

Bu emniyet ağını yerel Git ortamınıza bağlamak için `.git/hooks/pre-push` dosyası oluşturup çalıştırılabilir yapabilirsiniz (`chmod +x .git/hooks/pre-push`).  
Kanca, push edilen hedef dalları Git'in stdin'den verdiği listeden okur (`git push origin HEAD:main` gibi dolaylı push'lar da yakalanır). Korumalı dal listesi varsayılan olarak **boştur**; ekip projelerinde `PROTECTED_BRANCHES` değişkeniyle açılır.

```bash
#!/usr/bin/env bash
set -euo pipefail

# Ekip projelerinde doğrudan push'a kapalı dallar (boşluklu liste). Tek kişilik projede boş bırakın.
# Örnek: export PROTECTED_BRANCHES="main master production"
PROTECTED_BRANCHES="${PROTECTED_BRANCHES:-}"

# 1. Korumalı dallara doğrudan push engeli (Git her hedef ref için bir satır gönderir)
while read -r local_ref local_sha remote_ref remote_sha; do
    target="${remote_ref#refs/heads/}"
    for protected in $PROTECTED_BRANCHES; do
        if [ "$target" = "$protected" ]; then
            echo "HATA: Korumalı '$target' dalına doğrudan push yapılamaz."
            echo "Bir özellik dalı açıp Pull Request (PR) kullanın."
            exit 1
        fi
    done
done

echo "==> [Pre-Push] Derin doğrulama ve testler çalıştırılıyor..."

# 2. Test ve derleme kontrolü
if [ -f Makefile ] && grep -q "^verify:" Makefile; then
    make verify
elif [ -f Makefile ] && grep -q "^test:" Makefile; then
    make test
fi

echo "==> [Pre-Push] Tüm kontroller başarıyla tamamlandı."
```
