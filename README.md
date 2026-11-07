# MFMX Project Conventions

> **Temel İlke:** "Hafızayı sohbete değil, diske sabitle."  
> İnsan geliştiriciler ve AI kodlama ajanları (Antigravity, Claude Code, Cursor, OpenCode vb.) için bağlam kaybını (*context drift*) ve denetimsiz hataları önleyen proje yönetim ve sürüm kontrol şablonları.

---

## 🎯 Çözülen 3 Temel Problem

- **Context Drift:** Oturum sıfırlanınca projenin amacının ve mimari kararlarının unutulması.
- **Varsayımla Kodlama:** Ajanın doğrulamadan veya sormadan tahminle iş yapıp sistemi bozması.
- **Doğrulanmamış İddia:** Test/build çıktısı görmeden "düzelttim" denilerek işin kapatılması.

---

## 📂 Çekirdek Dosyalar

| Dosya | Görev | Temel Kural |
| :--- | :--- | :--- |
| [`TODO.md`](./TODO.md) | Aktif Sprint & Backlog | En başta *Bağlam Çapası (Context Anchor)* zorunlu. Bitince `TODO.DONE.md`'ye taşınır. |
| [`TODO.DONE.md`](./TODO.DONE.md) | Doğrulanmış İş Arşivi | **Ters kronolojik** (en yeni en üstte). **Doğrulama komutu/çıktısı** zorunlu. |
| [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) | Git & Commit Kuralları | Conventional Commits (`:`), atomik commitler, pre-push secret taraması. **Push izne tabidir.** |
| [`README.md`](./README.md) | Proje Vitrini & Mimari | Mimari özet, kurulum adımları ve operasyonel komutlar. |

---

## 🌍 Küresel Standart Uyumu

- **Conventional Commits v1.0.0 (Angular/Google):** Format: `<type>(<scope>): <açıklama>`. Emir kipi, küçük harf, noktasız bitiş.
- **Linux Kernel Felsefesi:** Atomik commitler; refaktör ile özellik/düzeltme ayrımı.
- **Keep a Changelog + Test-Driven:** Değişiklik listesine ek olarak **çalıştırılan test & exit code** kanıtı şartı.
- **AGENTS.md / Context Anchoring:** Projenin amacı ve operasyon sınırları diske çakılıdır.

---

## 🚀 Hızlı Kullanım

1. [`TODO.md`](./TODO.md), [`TODO.DONE.md`](./TODO.DONE.md) ve [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) dosyalarını projenizin kök dizinine kopyalayın.
2. `TODO.md` başındaki **Bağlam ve Amaç** kısmını projenize göre doldurun; görevleri sıralayın.
3. Tamamlanan görevi `TODO.md`'den `TODO.DONE.md`'nin **en üstüne** zaman damgası ve test çıktısıyla aktarın.
4. `GIT_STANDARDS.md` kurallarıyla atomik commit atın; **kullanıcı onayı olmadan push çalıştırmayın**.

---

## 📜 4 Altın Kural

1. **Tahmin Yasak:** Emin olunmayan yerde varsayımla koda girilmez; soru sorulur veya `ask.md` kuyruğuna yazılır.
2. **Push İzne Tabi:** Lokal commit serbesttir; `git push` yalnızca açık kullanıcı onayıyla çalışır.
3. **Kanıt Şartı:** `build`, `test` veya `lint` çıktısı (exit code 0) olmadan iş bitti sayılamaz.
4. **Sıfır Kalıntı:** İş bitiminde geçici test dosyaları, process'ler ve log artıkları temizlenir.

---

## Lisans
MIT
