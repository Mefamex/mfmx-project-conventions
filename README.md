# mfmx-project-conventions

|              |                                                                |
| ------------ | -------------------------------------------------------------- |
| **Author**   | [Mefamex](https://github.com/Mefamex)                          |
| **Website**  | [https://mefamex.com](https://mefamex.com)                     |
| **License**  | MIT                                                            |
| **Created**  | 2026-11-07                                                     |
| **Updated**  | 2026-11-22                                                     |
| **Stack**    | Markdown, YAML, GNU Make, Bash (Git hook)                      |
| **Platform** | Dil ve platform bağımsız; her Git deposu                       |
| **Status**   | Active Development                                             |

Hem geliştiriciler hem de AI kodlama ajanları (Claude Code, OpenCode, Antigravity, Cursor vb.) için proje yönetimi, belgeleme ve sürüm kontrolü şablonları ile rehberi.  
Temel ilke: **"Hafızayı sohbete değil, diske sabitle."** Dosyaları olduğu gibi kopyalayabilir ya da kendi projenizde eksik olanı bu rehbere bakarak tamamlayabilirsiniz.  
Bu README de [`docs/standards/README.STANDARDS.md`](./docs/standards/README.STANDARDS.md) kurallarına göre yazılmıştır; kendi README'nizi hazırlarken örnek olarak kullanabilirsiniz.

> **Çalışmaya başlarken (geliştirici ve AI ajanı):** Tüm çalışma belgeleri `docs/` altındadır. Her oturumda önce [`docs/TODO.md`](./docs/TODO.md) (Bağlam Çapası, Hızlı Giriş, aktif sprint), sonra [`docs/ASK.md`](./docs/ASK.md) (açık sorular ve Karara Bağlananlar kapısı), sonra [`docs/NOTES.md`](./docs/NOTES.md) okunur. Bir özellik üzerinde çalışılacaksa [`docs/features/README.md`](./docs/features/README.md) dizininden yalnızca o özelliğin dosyası açılır. Varsa gizli notlar için [`docs/NOTES.local.md`](./docs/NOTES.local.example.md) ve özelliğin `.local.md` dosyası da tam yoluyla okunur (repoya girmez, arama araçları göstermez; içeriği dışarı taşınmaz). Kurallar [`docs/standards/`](./docs/standards/) altındadır.

---

## 1. Mimari ve Akış

Dosyaların bir iş döngüsü içinde birbirine bağlanışı (iş bitince sıradaki görev için tekrar `docs/TODO.md`):

```text
[ docs/TODO.md ] ──> [ Kodlama ] ──┬──> Belirsizlik ──> [ docs/ASK.md ] ──cevap──> [ docs/ASKED/<konu>.md ]
                                   ├──> Öğrenilen kısıt / elenen yol ──> [ docs/NOTES.md ]
                                   ├──> Özelliğin bugünkü hâli ──> [ docs/features/<ozellik>.md ]
                                   ├──> Gizli bağlam ──> [ docs/NOTES.local.md ] (repoda yok)
                                   └──> [ make verify ] ──> [ docs/TODO.DONE.md ] ──> commit ──> onay ──> push
```

---

## 2. Temel Yetenekler

* **Bağlam kaybını önler (context drift):** Projenin amacı `docs/TODO.md` başındaki Bağlam Çapası'nda, kararların gerekçesi `docs/NOTES.md`'de durur; oturum sıfırlansa da kimse sıfırdan başlamaz.
* **Tahminle kodlamayı engeller:** Kritik ikilemler `docs/ASK.md`'ye seçenekleriyle yazılır; otonom alınan kararlar "Kendi Kararım" tablosuyla onaylanana kadar denetlenebilir kalır.
* **Verilen kararı unutturmaz:** Cevaplanan sorular `docs/ASKED/<konu>.md` dosyalarında silinmeden tutulur; `docs/ASK.md` sonundaki kapı listesi her oturumda okunduğu için karar gözden kaçmaz, değişen karar "Geçersiz" olarak işaretlenir.
* **Özelliği tek dosyada anlatır:** İsteğe bağlı `docs/features/` klasöründe her özelliğin bugünkü hâli (nasıl çalışır, ayarlar, tuzaklar, nasıl test edilir) tek dosyadadır; ajan yalnızca üzerinde çalıştığı özelliğin dosyasını okur.
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

# 2. Kök şablonlarını projenizin köküne kopyalayın
cp mfmx-project-conventions/{CHANGELOG.md,config.example.yaml,.env.example,Makefile,.gitignore} ./projem/

# 3. Çalışma belgelerini docs/ altına kopyalayın (kural belgeleri de dahil)
mkdir -p ./projem/docs/ASKED
cp mfmx-project-conventions/docs/{TODO.md,ASK.md,NOTES.md,NOTES.local.example.md,STRUCTURE.md,TODO.DONE.md} ./projem/docs/
cp mfmx-project-conventions/docs/ASKED/_SABLON.md ./projem/docs/ASKED/
cp -r mfmx-project-conventions/docs/standards ./projem/docs/

# 3b. (İsteğe bağlı) Proje 4 veya daha fazla özelliğe ulaşınca özellik belgeleri klasörü
mkdir -p ./projem/docs/features
cp mfmx-project-conventions/docs/features/{README.md,_SABLON.md} ./projem/docs/features/

# 4. Makefile'ı yığınınıza göre doldurun; make install, config.yaml, .env ve docs/NOTES.local.md yoksa şablondan oluşturur
cd projem && make && make install
```

Sonra:

1. `docs/TODO.md` başındaki Bağlam ve Amaç kısmını doldurun, görevleri sıralayın. `docs/STRUCTURE.md`'yi projenizin klasörlerine göre yazın.
2. `Makefile` içindeki `# [...]` satırlarını gerçek komutlarla değiştirin (dosyanın başındaki notlara bakın).
3. Mimari bir ikilemde `docs/ASK.md`'ye seçenekleriyle yazın. Cevaplanan soruyu `docs/ASK.md` başındaki 6 adımla `docs/ASKED/<konu>.md` dosyasına işleyin. Sistemin öğrettiği kısıt ve elenen yolları `docs/NOTES.md`'ye kaydedin. `docs/features/` kullanıyorsanız bir özelliğin davranışını değiştiren her commit'te o özelliğin dosyasını da güncelleyin.
4. Biten görevi `docs/TODO.DONE.md`'nin en üstüne zaman damgası ve test çıktısıyla taşıyın; kullanıcıyı etkileyen sonucu `CHANGELOG.md`'ye özetleyin.
5. `docs/standards/GIT_STANDARDS.md` kurallarıyla atomik commit atın; onay olmadan push etmeyin.

### 4.2. AI ajanı ile kurulum

Kullandığınız AI ajanına şu komutu verebilirsiniz:

```text
https://github.com/Mefamex/mfmx-project-conventions reposundaki tüm dosyaları ve kuralları incele. Mevcut projemi analiz et; şablon dosyalarını (kökte: CHANGELOG.md, config.example.yaml, .env.example, Makefile, .gitignore; docs/ altında: TODO.md, ASK.md, NOTES.md, NOTES.local.example.md, STRUCTURE.md, TODO.DONE.md, ASKED/_SABLON.md; proje 4 veya daha fazla özellik içeriyorsa features/README.md ve features/_SABLON.md) projemin yığınına ve bağlamına göre uyarlayarak oluştur. docs/standards/ klasöründeki kural belgelerini (GIT_STANDARDS.md, PRE_COMMIT_CHECKLIST.md, PRE_PUSH_CHECKLIST.md, README.STANDARDS.md) referans al. Önce eksik dosyaların listesini göster, onayımı al; bitince `make` ve `make verify` çıktısını göster. Bundan sonraki tüm adımlarda bu kurallara bağlı kal.
```

---

## 5. Yapılandırma

- Repoda yalnızca şablon `config.example.yaml` izlenir. Gerçek ayarlar `config.yaml`'dadır, `.gitignore`'dadır ve `make install` dosya yoksa örnekten kopyalar.
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

# Git hook'larını kurmak için: docs/standards/PRE_COMMIT_CHECKLIST.md ve PRE_PUSH_CHECKLIST.md
# içindeki betikleri .git/hooks/ altına kaydedip çalıştırılabilir yapın
chmod +x .git/hooks/pre-commit .git/hooks/pre-push

# Bu reponun kendi bütünlük testi (CI her PR'da da çalıştırır)
bash scripts/check.sh
```

---

## 7. Güvenlik ve Kırmızı Çizgiler

1. **Tahmin yasak:** Emin olunmayan yerde varsayımla koda girilmez; soru sorulur ya da `docs/ASK.md`'ye yazılır.
2. **Push izne tabi:** Lokal commit serbesttir; `git push` yalnızca açık kullanıcı onayıyla çalışır. `--force` yasaktır.
3. **Kanıt şartı:** `build`, `test` veya `lint` çıktısı (exit code 0) olmadan iş bitti sayılmaz. Boş şablon Makefile'ın `make verify` çıktısı kanıt değildir.
4. **Sıfır kalıntı:** İş bitiminde geçici dosyalar, process'ler ve log artıkları temizlenir (`make clean`).
5. **Sıfır sızıntı:** Secret ve kişisel veri (telefon, IP, SSID, şifre, token) çalışma dosyalarına da git geçmişine de girmez. Gizli bağlam repoya girmeyen `docs/NOTES.local.md`'ye, özelliğe özgü gizli maddeler `docs/features/<ozellik>.local.md`'ye yazılır; içeriği izlenen dosyalara, commit / PR metnine veya CHANGELOG'a taşınmaz.

---

## 8. Proje Yapısı (Ana Dizin)

Ana dizindeki dosya ve klasörler. Tüm klasörlerin ve önemli dosyaların haritası için: [`docs/STRUCTURE.md`](./docs/STRUCTURE.md).

- [`CHANGELOG.md`](./CHANGELOG.md) — Okuyucuya yönelik değişiklik özeti.
- [`config.example.yaml`](./config.example.yaml) — Yapılandırma şablonu; gerçek `config.yaml` bundan kopyalanır ve repoya girmez.
- [`.env.example`](./.env.example) — Ortam değişkeni şablonu; gerçek `.env` repoya girmez.
- [`Makefile`](./Makefile) — Tek komutla yaşam döngüsü; tek başına `make` yardım menüsünü basar.
- [`.gitignore`](./.gitignore) — Secret, yerel ayar, önbellek, derleme ve OS artıkları.
- [`LICENSE`](./LICENSE) — MIT lisansı.
- [`scripts/`](./scripts/) — Bu reponun kendi araçları; şablon değildir, kopyalanmaz.
    - [`check.sh`](./scripts/check.sh) — Bütünlük testi; `bash scripts/check.sh` ile çalışır.
- [`.github/`](./.github/) — GitHub ayarları.
    - [`workflows/check.yml`](./.github/workflows/check.yml) — Her PR'da ve `main`'e push'ta `scripts/check.sh`'i çalıştıran CI.
- [`docs/`](./docs/) — Tüm çalışma belgeleri ve kurallar.
    - [`TODO.md`](./docs/TODO.md) — Giriş kapısı: Bağlam Çapası, Hızlı Giriş, aktif sprint ve backlog.
    - [`ASK.md`](./docs/ASK.md) — Açık sorular, onay bekleyen "Kendi Kararım" kayıtları ve sonda Karara Bağlananlar kapısı.
    - [`NOTES.md`](./docs/NOTES.md) — Teknik bellek: kararların nedeni, elenen yollar, ölçülmüş sınırlar.
    - [`NOTES.local.example.md`](./docs/NOTES.local.example.md) — Gizli notlar şablonu; gerçek `docs/NOTES.local.md` repoya girmez.
    - [`STRUCTURE.md`](./docs/STRUCTURE.md) — Tüm klasörlerin ve önemli dosyaların haritası.
    - [`TODO.DONE.md`](./docs/TODO.DONE.md) — Yapılan işlerin kanıtlı haritası (en yeni en üstte).
    - [`ASKED/`](./docs/ASKED/) — Cevaplanmış soruların konu bazlı kalıcı karar kayıtları; şablon: [`_SABLON.md`](./docs/ASKED/_SABLON.md).
    - [`features/`](./docs/features/) — (İsteğe bağlı) Özellik başına bugünkü hâl belgeleri; dizin: [`README.md`](./docs/features/README.md), şablon: [`_SABLON.md`](./docs/features/_SABLON.md).
    - [`standards/`](./docs/standards/) — Nasıl çalışılır: Git standartları, commit / push kontrol listeleri, README standardı.

---

## 9. Lisans

[MIT](./LICENSE) — [Mefamex](https://github.com/Mefamex)
