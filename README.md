# MFMX Project Conventions

> **Temel İlke:** "Hafızayı sohbete değil, diske sabitle."  
> Geliştiriciler ve AI kodlama ajanları (Antigravity, Claude Code, Cursor, OpenCode vb.) için bağlam kaybını (context drift) ve denetimsiz hataları önleyen evrensel proje yönetim ve sürüm kontrol şablonları.

---

## Çözülen 3 Temel Problem

- **Context Drift:** Oturum sıfırlanınca projenin amacının ve mimari kararlarının unutulması.
- **Varsayımla Kodlama:** Ajanın doğrulamadan veya sormadan tahminle iş yapıp sistemi bozması.
- **Doğrulanmamış İddia:** Test/build çıktısı görmeden "düzelttim" denilerek işin kapatılması.

---

## Çekirdek Dosyalar

| Dosya | Görev | Temel Kural |
| :--- | :--- | :--- |
| [`TODO.md`](./TODO.md) | Aktif Sprint ve Backlog | En başta Bağlam Çapası (Context Anchor) zorunlu. Bitince `TODO.DONE.md`'ye taşınır. |
| [`TODO.DONE.md`](./TODO.DONE.md) | Doğrulanmış İş Arşivi | Ters kronolojik (en yeni en üstte). Doğrulama komutu ve çıktısı zorunlu. |
| [`ASK.md`](./ASK.md) | Soru ve Karar Kuyruğu | "Tahminle koda girilmez." Açık kararlar, otonom tercihler (Kendi Kararım) ve arşivleme. |
| [`NOTES.md`](./NOTES.md) | Dahili Teknik Bellek | Mimari kararlar, denenip elenen alternatifler, sistem limitleri ve kazanılan dersler. |
| [`config.yaml`](./config.yaml) | Yapılandırma Şablonu | Kaskad ayar modeli (ENV > config.yaml > varsayılan). Sıfır gizli anahtar, birimli isimlendirme. |
| [`Makefile`](./Makefile) | Standart Görev Yöneticisi | Self-documenting help. 6 zorunlu hedef: `install`, `reinstall`, `update`, `run`, `clean`, `remove`. |
| [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) | Git ve Commit Kuralları | Conventional Commits (`:`), atomik commitler, pre-push secret taraması. Push izne tabidir. |
| [`pre_commit_checklist.md`](./pre_commit_checklist.md) | Commit Öncesi Kontrol Listesi | Sıfır sızıntı (secrets), kapsam kontrolü, AI ajan tuzakları ve hızlı lint/format onay kapısı. |
| [`pre_push_checklist.md`](./pre_push_checklist.md) | Push Öncesi Kontrol Listesi | Kullanıcı onayı zorunluluğu, CI eşitliği, tam test/build paketi ve force push emniyeti. |
| [`README.standarts.md`](./README.standarts.md) | README Standart Kılavuzu | Standart başlık hiyerarşisi, meta tablosu ve içerik kuralları. |
| [`README.md`](./README.md) | Proje Vitrini ve Mimari | Mimari özet, kurulum adımları ve operasyonel komutlar. |

---

## Küresel Standart Uyumu

- **Conventional Commits v1.0.0 (Angular/Google):** Format: `<type>(<scope>): <açıklama>`. Emir kipi, küçük harf, noktasız bitiş.
- **Linux Kernel Felsefesi:** Atomik commitler; refaktör ile özellik/düzeltme ayrımı.
- **Keep a Changelog + Test-Driven:** Değişiklik listesine ek olarak çalıştırılan test ve exit code kanıtı şartı.
- **Marmelab Self-Documenting Makefile:** Tek başına `make` yazıldığında hizalı CLI yardım menüsü dökülür.
- **12-Factor App ve Cloud-Native:** Yapılandırma ortam değişkeniyle ezilebilir; `config.yaml` repoda güvenle izlenir.

---

## Yapay Zekâ Ajanı İle Otomatik Kurulum (Prompt)

Mevcut veya yeni bir projenizde bu standartları tek adımda kurmak için kullandığınız AI ajanına şu komutu verebilirsiniz:

```text
https://github.com/Mefamex/mfmx-project-conventions/ reposundaki tüm dosyaları ve kuralları incele. Mevcut projemi analiz ederek oradaki dosya yapısını (TODO.md, TODO.DONE.md, ASK.md, NOTES.md, config.yaml, Makefile) ve standartları (GIT_STANDARDS.md, pre_commit_checklist.md, pre_push_checklist.md, README.standarts.md) bu projeye uyarla. Eksik dosyaları projemin bağlamına göre oluştur ve bundan sonraki tüm adımlarda bu kurallara bağlı kal.
```

---

## Manuel Kurulum ve Hızlı Kullanım

1. Bu repodaki şablon dosyalarını projenizin kök dizinine kopyalayın.
2. `TODO.md` başındaki Bağlam ve Amaç kısmını projenize göre doldurun; görevleri sıralayın.
3. `Makefile` içindeki komutları projenizin yığınına (`uv`, `pnpm`, `go` vb.) göre doldurun; `make` yazarak test edin.
4. Mimari bir ikilem veya karar gerektiğinde `ASK.md` dosyasına seçenekleriyle yazın.
5. Karar gerekçelerini, elenen yöntemleri ve sistem sınırlarını `NOTES.md` dosyasına kaydedin.
6. `config.yaml` dosyasındaki ayarları projenize göre belirleyin; gizli anahtarları ortam değişkenleri üzerinden yönetin.
7. Tamamlanan görevi `TODO.md`'den `TODO.DONE.md`'nin en üstüne zaman damgası ve test çıktısıyla aktarın.
8. `GIT_STANDARDS.md` kurallarıyla atomik commit atın; kullanıcı onayı olmadan push çalıştırmayın.

---

## 4 Altın Kural

1. **Tahmin Yasak:** Emin olunmayan yerde varsayımla koda girilmez; soru sorulur veya `ASK.md` kuyruğuna yazılır.
2. **Push İzne Tabi:** Lokal commit serbesttir; `git push` yalnızca açık kullanıcı onayıyla çalışır.
3. **Kanıt Şartı:** `build`, `test` veya `lint` çıktısı (exit code 0) olmadan iş bitti sayılamaz.
4. **Sıfır Kalıntı:** İş bitiminde geçici test dosyaları, process'ler ve log artıkları temizlenir (`make clean`).

---

## Lisans
MIT
