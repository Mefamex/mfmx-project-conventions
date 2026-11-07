# MFMX Project Conventions (Universal Project Starter & Blueprint)

> **"Hafızayı sohbete değil, diske sabitle. Tahminle koda girme, kanıtla doğrula."**  
> Bu repo; modern yazılım projelerinde geliştiriciler ve AI kodlama ajanları (Antigravity, Claude Code, Cursor, OpenCode vb.) için sıfır bağlam kaybı (*zero context drift*), tam denetlenebilirlik ve yüksek mühendislik disiplini sağlayan **standart proje iskeletidir (starter blueprint)**.

---

## 🎯 Çözülen 4 Temel Problem

- **Context Drift (Bağlam Kaybı):** Oturum sıfırlanınca projenin amacının ve mimari kararlarının unutulması.
- **Varsayımla Kodlama:** Ajanın doğrulamadan veya sormadan tahminle iş yapıp sistemi bozması.
- **Doğrulanmamış İddia:** Test/build çıktısı görmeden "düzelttim" denilerek işin kapatılması.
- **Dağınık Yapılandırma & Güvenlik:** Kod içine gömülü ayarlar ve kontrolsüz git push kazaları.

---

## 📂 Standart Proje Anatomisi (10 Temel Dosya)

Herhangi bir yeni projeye başlarken bu repoyu klonlayıp veya dosyaları kopyalayarak doğrudan kullanabilirsiniz:

| Dosya | Kategori | Görev ve Temel Kural |
| :--- | :--- | :--- |
| [`TODO.md`](./TODO.md) | Görev Yönetimi | En başta *Bağlam Çapası (Context Anchor)* zorunlu. Bitince `TODO.DONE.md`'ye aktarılır. |
| [`TODO.DONE.md`](./TODO.DONE.md) | İş Arşivi | **Ters kronolojik** (en yeni en üstte). **Doğrulama komutu/çıktısı** zorunlu. |
| [`ASK.md`](./ASK.md) | Karar Kuyruğu | **"Tahminle koda girilmez."** Açık kararlar, otonom tercihler (`KENDİ KARARIM`) ve arşivleme. |
| [`NOTES.md`](./NOTES.md) | Mimari Bellek | Denenip vazgeçilen yollar (*discarded approaches*), donanım kısıtları ve teknik gerekçeler. |
| [`AGENTS.md`](./AGENTS.md) | Ajan Operasyonu | AI ajanları için doğrulanmış komutlar, dosya dokunulmazlığı ve güvenlik sınırları. |
| [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) | Sürüm Kontrolü | Conventional Commits (`:`), atomik commitler, pre-push secret taraması. **Push izne tabidir.** |
| [`config.example.yaml`](./config.example.yaml) | Yapılandırma | Kaskad ayar modeli: `Ortam Değişkeni (ENV) > config.yaml > Kod İçi Varsayılan`. |
| [`.gitignore`](./.gitignore) | Dosya Hijyeni | Secret'lar, API token'lar, `.env`, `__pycache__`, OS ve IDE artıklarını dışlama. |
| [`Makefile`](./Makefile) | Otomasyon | Tek komutla yönetim: `install`, `dev`, `lint`, `test`, `verify`, `build`, `clean`. |
| [`README.md`](./README.md) | Proje Vitrini | Sistemin amacı, mimari şeması, kurulum adımları ve kullanım kılavuzu. |

---

## 🌍 Küresel Standart Uyumu

- **Conventional Commits v1.0.0 (Angular/Google):** Format: `<type>(<scope>): <açıklama>`. Emir kipi, küçük harf, noktasız bitiş.
- **Linux Kernel Felsefesi:** Atomik commitler; refaktör ile özellik/düzeltme ayrımı.
- **Keep a Changelog + Test-Driven:** Değişiklik listesine ek olarak **çalıştırılan test & exit code** kanıtı şartı.
- **AGENTS.md Specification:** Ajanların projenin operasyonel sınırlarını diske çakılı okuması.

---

## 🚀 Hızlı Kullanım (Yeni Bir Projeye Başlarken)

1. Bu repoyu yeni projenizin dizinine kopyalayın.
2. `TODO.md` başındaki **Bağlam ve Amaç** kısmını projenize göre doldurun; görevleri sıralayın.
3. `AGENTS.md` içine projenizin teknoloji yığınını ve doğrulanmış komutlarını (`make dev`, `make test` vb.) yazın.
4. `config.example.yaml` dosyasını `config.yaml` olarak kopyalayıp ayarlarınızı belirleyin.
5. Mimari bir ikilem veya karar gerektiğinde `ASK.md` dosyasına seçenekleriyle yazın.
6. Tamamlanan görevi `TODO.md`'den `TODO.DONE.md`'nin **en üstüne** zaman damgası ve test çıktısıyla aktarın.
7. `GIT_STANDARDS.md` kurallarıyla atomik commit atın; **kullanıcı onayı olmadan asla push yapmayın**.

---

## 📜 5 Altın Kural

1. **Tahmin Yasak:** Emin olunmayan yerde varsayımla koda girilmez; soru sorulur veya `ASK.md` kuyruğuna yazılır.
2. **Push İzne Tabi:** Lokal commit serbesttir; `git push` yalnızca açık kullanıcı onayıyla çalışır.
3. **Kanıt Şartı:** `build`, `test` veya `lint` çıktısı (exit code 0) olmadan iş bitti sayılamaz.
4. **Kaskad Konfigürasyon:** Ayarlar koda gömülmez; `ENV > config.yaml > default` zinciri korunur.
5. **Sıfır Kalıntı:** İş bitiminde geçici test dosyaları, process'ler ve log artıkları temizlenir (`make clean`).

---

## Lisans
MIT
