# AGENTS.md — Yapay Zekâ Kodlama Ajanı Kılavuzu

> **Hedef:** Bu depoda çalışan AI ajanları (Antigravity, Claude Code, Cursor, OpenCode vb.) için bağlayıcı operasyonel yönergelerdir. Ajan projeye dokunmadan önce bu kuralları okumak ve harfiyen uygulamak zorundadır.

---

## 1. Proje Özeti ve Teknoloji Yığını

- **Amaç:** [Projenin tek cümlelik net özeti]
- **Yığın (Stack):** [Örn: Python 3.12+ (`uv`) / Go 1.22+ / Astro 7 + React 19 / Bash]
- **Paket Yöneticisi:** [`uv` / `pnpm` / `go mod` / `cargo`]
- **Hedef Çalışma Ortamı:** [Örn: Linux (Arch / systemd) / Cloudflare Worker / Docker]

---

## 2. Doğrulanmış Komutlar (Verified Commands)

Ajan yalnızca aşağıda doğrulanmış komutları kullanmalıdır; tahminle komut uyduramaz:

```bash
# Bağımlılıkları kurma
make install            # veya pnpm install / uv sync

# Geliştirme sunucusunu arka planda başlatma
make dev                # veya pnpm run dev --background

# Statik analiz ve tip kontrolü (her kod değişikliği sonrası zorunlu)
make lint               # veya ruff check . / astro check / shellcheck

# Birim ve entegrasyon testlerini koşturma
make test               # veya pytest / pnpm test / go test ./...

# Üretim derlemesi
make build              # veya pnpm run build / go build
```

---

## 3. Mimari Sınırlar ve Dosya Dokunulmazlığı

- **Otomatik Üretilen Dosyalar:** `dist/`, `build/`, `*.min.js`, `_redirects` veya otomatik oluşturulan şema dosyalarına **asla elle müdahale etme**; bunları üreten kaynak betiği düzenle.
- **Modülerlik Kuralı:** Tek bir dosyaya yüzlerce satır yığma. Yardımcı fonksiyonları `src/utils/` veya `lib/` altına modüler biçimde dağıt.
- **Kaskad Ayar Modeli:** Ayarları koda gömme (`hardcode` yasaktır). `config.yaml` ve ortam değişkeni (`APP_*`) desteği sağla.

---

## 4. Güvenlik ve Kırmızı Çizgiler (Safety Rules)

1. **Yıkıcı İşlemler Yasaktır:** `rm -rf`, disk formatlama, veri silme veya `git reset --hard` gibi geri dönülemez komutlar kullanıcının açık yazılı onayı olmadan çalıştırılamaz.
2. **`sudo` Yetkisi:** Ajan sistem paketlerini (`pacman`, `apt`) veya çekirdek ayarlarını izinsiz değiştiremez.
3. **Push Gatekeeping:** Lokal `git commit` serbest ve teşviktir; ancak **`git push` kesinlikle kullanıcı onayına tabidir**.
4. **Gizlilik:** `.env`, API token, kişisel telefon, IP veya SSID bilgileri loglara veya git geçmişine yazılamaz.

---

## 5. Değişiklik ve Teslim Disiplini

- Her mantıksal adım için tek bir atomik commit at ([`GIT_STANDARDS.md`](./GIT_STANDARDS.md)).
- Tamamlanan her işi `TODO.md`'den [`TODO.DONE.md`](./TODO.DONE.md)'ye test kanıtıyla aktar.
- Kararsız kaldığın mimari adımları [`ASK.md`](./ASK.md)'ye yaz ve dur.
