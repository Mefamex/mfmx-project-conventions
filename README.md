# mfmx-project-conventions

|              |                                                                |
| ------------ | -------------------------------------------------------------- |
| **Author**   | [Mefamex](https://github.com/Mefamex)                          |
| **Website**  | [https://mefamex.com](https://mefamex.com)                     |
| **License**  | MIT                                                            |
| **Created**  | 2026-11-07                                                     |
| **Updated**  | 2026-11-11                                                     |
| **Stack**    | Markdown, YAML, GNU Make, Bash (Git hook)                      |
| **Platform** | Dil ve platform bağımsız; her Git deposu                       |
| **Status**   | Active Development                                             |

Hem geliştiriciler hem de AI kodlama ajanları (Claude Code, OpenCode, Antigravity, Cursor vb.) için proje yönetimi, belgeleme ve sürüm kontrolü şablonları ile rehberi.  
Temel ilke: **"Hafızayı sohbete değil, diske sabitle."** Dosyaları olduğu gibi kopyalayabilir ya da kendi projenizde eksik olanı bu rehbere bakarak tamamlayabilirsiniz.  
Bu README de [`standards/README.STANDARDS.md`](./standards/README.STANDARDS.md) kurallarına göre yazılmıştır; kendi README'nizi hazırlarken örnek olarak kullanabilirsiniz.

---

## 1. Mimari ve Akış

Dosyaların bir iş döngüsü içinde birbirine bağlanışı:

```text
[ TODO.md ] ──> [ Kodlama ] ──> [ Belirsizlik? ] ──evet──> [ ASK.md ] ──karar──┐
     ^               │                                                         │
     │               ├──> [ Öğrenilen kısıt / elenen yol ] ──> [ NOTES.md ]    │
     │               v                                                         │
     │    [ make verify (kanıt) ] ──> [ docs/TODO.DONE.md ] ──> [ commit ] ──> [ onay ] ──> [ push ]
     └─────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Temel Yetenekler

* **Bağlam kaybını önler (context drift):** Projenin amacı `TODO.md` başındaki Bağlam Çapası'nda, kararların gerekçesi `NOTES.md`'de durur; oturum sıfırlansa da kimse sıfırdan başlamaz.
* **Tahminle kodlamayı engeller:** Kritik ikilemler `ASK.md`'ye seçenekleriyle yazılır; otonom alınan kararlar "Kendi Kararım" tablosuyla onaylanana kadar denetlenebilir kalır.
* **Verilen kararı unutturmaz:** Cevaplanan sorular `docs/ASKED/<konu>.md` dosyalarında silinmeden tutulur; `ASK.md` sonundaki kapı listesi her oturumda okunduğu için karar gözden kaçmaz, değişen karar "Geçersiz" olarak işaretlenir.
* **Doğrulanmamış iddiayı kapatır:** `docs/TODO.DONE.md`'ye çalıştırılan komut ve exit code yazılmadan iş bitmiş sayılmaz.
* **Sızıntıyı erken yakalar:** Commit öncesi hook yalnızca eklenen satırları tarar, gitleaks kuruluysa onu kullanır.
* **Her yığında aynı komutlar:** `make install`, `make run`, `make verify` her projede aynı anlamı taşır.

---

## 3. Teknoloji Yığını ve Gereksinimler

- **Zorunlu:** Git, GNU Make, Bash.
- **İsteğe bağlı:** [gitleaks](https://github.com/gitleaks/gitleaks) (secret taraması), projenizin linter / formatter araçları.
- **Dayandığı standartlar:**
  - Conventional Commits v1.0.0 (`add` / `update` tipleriyle genişletilmiş)
  - Atomik commit ilkesi: refaktör ile özellik / düzeltme ayrı commitlenir
  - Keep a Changelog + kanıt şartı (çalıştırılan test ve exit code)
  - Self-documenting Makefile: tek başına `make` hizalı yardım menüsü basar
  - 12-Factor App: yapılandırma ortam değişkeniyle ezilebilir

---

## 4. Kurulum ve Hızlı Başlangıç

### 4.1. Manuel kurulum

```bash
# 1. Repoyu klonlayın
git clone https://github.com/Mefamex/mfmx-project-conventions.git

# 2. İhtiyacınız olan şablonları projenizin köküne kopyalayın
cp mfmx-project-conventions/{TODO.md,CHANGELOG.md,ASK.md,NOTES.md,config.yaml,.env.example,Makefile,.gitignore} ./projem/

# 3. Proje hakkındaki şablonları docs/ altına kopyalayın
mkdir -p ./projem/docs/ASKED
cp mfmx-project-conventions/docs/{STRUCTURE.md,TODO.DONE.md} ./projem/docs/
cp mfmx-project-conventions/docs/ASKED/_SABLON.md ./projem/docs/ASKED/

# 4. Makefile'ı yığınınıza göre doldurup yardım menüsünü test edin
cd projem && make
```

Sonra:

1. `TODO.md` başındaki Bağlam ve Amaç kısmını doldurun, görevleri sıralayın. `docs/STRUCTURE.md`'yi projenizin klasörlerine göre yazın.
2. `Makefile` içindeki `# [...]` satırlarını gerçek komutlarla değiştirin (dosyanın başındaki notlara bakın).
3. Mimari bir ikilemde `ASK.md`'ye seçenekleriyle yazın. Cevaplanan soruyu `ASK.md` başındaki 6 adımla `docs/ASKED/<konu>.md` dosyasına işleyin. Sistemin öğrettiği kısıt ve elenen yolları `NOTES.md`'ye kaydedin.
4. Biten görevi `docs/TODO.DONE.md`'nin en üstüne zaman damgası ve test çıktısıyla taşıyın; kullanıcıyı etkileyen sonucu `CHANGELOG.md`'ye özetleyin.
5. `standards/GIT_STANDARDS.md` kurallarıyla atomik commit atın; onay olmadan push etmeyin.

### 4.2. AI ajanı ile kurulum

Kullandığınız AI ajanına şu komutu verebilirsiniz:

```text
https://github.com/Mefamex/mfmx-project-conventions reposundaki tüm dosyaları ve kuralları incele. Mevcut projemi analiz et; şablon dosyalarını (kökte: TODO.md, CHANGELOG.md, ASK.md, NOTES.md, config.yaml, .env.example, Makefile, .gitignore; docs/ altında: STRUCTURE.md, TODO.DONE.md, ASKED/_SABLON.md) projemin yığınına ve bağlamına göre uyarlayarak oluştur. standards/ klasöründeki kural belgelerini (GIT_STANDARDS.md, PRE_COMMIT_CHECKLIST.md, PRE_PUSH_CHECKLIST.md, README.STANDARDS.md) referans al. Önce eksik dosyaların listesini göster, onayımı al; bitince `make` ve `make verify` çıktısını göster. Bundan sonraki tüm adımlarda bu kurallara bağlı kal.
```

---

## 5. Yapılandırma

- Öncelik sırası: **Ortam değişkeni (ENV) > `config.yaml` > kod içi varsayılan.**
- ENV adı: `<ÖNEK>_<BÖLÜM>_<ANAHTAR>` (örn. `system.timeout_sec` → `APP_SYSTEM_TIMEOUT_SEC`).
- Süre ve boyut alanlarında birim ada eklenir: `timeout_sec`, `delay_ms`, `max_size_mb`.
- API anahtarı, şifre ve token **asla** `config.yaml`'a yazılmaz; ortam değişkeninden veya repoya girmeyen `.env` dosyasından okunur.

---

## 6. Kullanım ve Komutlar

```bash
# Yardım menüsü (varsayılan hedef)
make

# Taze klonda kurulum / çalıştırma / commit ve push öncesi tam doğrulama
make install
make run
make verify

# Git hook'larını kurmak için: standards/PRE_COMMIT_CHECKLIST.md ve PRE_PUSH_CHECKLIST.md
# içindeki betikleri .git/hooks/ altına kaydedip çalıştırılabilir yapın
chmod +x .git/hooks/pre-commit .git/hooks/pre-push
```

---

## 7. Güvenlik ve Kırmızı Çizgiler

1. **Tahmin yasak:** Emin olunmayan yerde varsayımla koda girilmez; soru sorulur ya da `ASK.md`'ye yazılır.
2. **Push izne tabi:** Lokal commit serbesttir; `git push` yalnızca açık kullanıcı onayıyla çalışır. `--force` yasaktır.
3. **Kanıt şartı:** `build`, `test` veya `lint` çıktısı (exit code 0) olmadan iş bitti sayılmaz. Boş şablon Makefile'ın `make verify` çıktısı kanıt değildir.
4. **Sıfır kalıntı:** İş bitiminde geçici dosyalar, process'ler ve log artıkları temizlenir (`make clean`).
5. **Sıfır sızıntı:** Secret ve kişisel veri (telefon, IP, SSID, şifre, token) çalışma dosyalarına da git geçmişine de girmez.

---

## 8. Proje Yapısı (Ana Dizin)

Ana dizindeki dosya ve klasörler. Tüm klasörlerin ve önemli dosyaların haritası için: [`docs/STRUCTURE.md`](./docs/STRUCTURE.md).

- [`TODO.md`](./TODO.md) — Giriş kapısı: Bağlam Çapası, aktif sprint ve backlog.
- [`ASK.md`](./ASK.md) — Açık sorular, onay bekleyen "Kendi Kararım" kayıtları ve sonda Karara Bağlananlar kapısı.
- [`NOTES.md`](./NOTES.md) — Teknik bellek: kararların nedeni, elenen yollar, ölçülmüş sınırlar.
- [`CHANGELOG.md`](./CHANGELOG.md) — Okuyucuya yönelik değişiklik özeti.
- [`config.yaml`](./config.yaml) — Yapılandırma şablonu (ENV > config.yaml > varsayılan).
- [`.env.example`](./.env.example) — Ortam değişkeni şablonu; gerçek `.env` repoya girmez.
- [`Makefile`](./Makefile) — Tek komutla yaşam döngüsü; tek başına `make` yardım menüsünü basar.
- [`.gitignore`](./.gitignore) — Secret, ortam, önbellek, derleme ve OS artıkları.
- [`LICENSE`](./LICENSE) — MIT lisansı.
- [`standards/`](./standards/) — Nasıl çalışılır: Git standartları, commit / push kontrol listeleri, README standardı.
- [`docs/`](./docs/) — Proje hakkında: projenin yapısı, yapılan işler ve verilen kararlar.
    - [`STRUCTURE.md`](./docs/STRUCTURE.md) — Tüm klasörlerin ve önemli dosyaların haritası.
    - [`TODO.DONE.md`](./docs/TODO.DONE.md) — Yapılan işlerin kanıtlı haritası (en yeni en üstte).
    - [`ASKED/`](./docs/ASKED/) — Cevaplanmış soruların konu bazlı kalıcı karar kayıtları; şablon: [`_SABLON.md`](./docs/ASKED/_SABLON.md).

---

## 9. Lisans

[MIT](./LICENSE) — [Mefamex](https://github.com/Mefamex)
