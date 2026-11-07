# MFMX Project Conventions (Disiplinli Proje & Ajan Yönetim Standartları)

> **"Hafızayı sohbet geçmişine emanet etme; diske sabitle."**  
> Bu repo; modern yazılım projelerinde insan geliştiriciler ile yapay zekâ kodlama ajanlarının (Antigravity, Claude Code, OpenCode, Cursor, Codex vb.) bağlamdan kopmadan (*zero context drift*), ölçülebilir, denetlenebilir ve endüstri standartlarında (Conventional Commits, Google, Angular, Linux Kernel) birlikte çalışmasını sağlayan proje dokümantasyon ve iş akışı şablonlarını içerir.

---

## 📌 Neden Bu Sistem?

Büyük dil modelleri (LLM) ile çalışırken karşılaşılan en büyük 3 problem:
1. **Context Drift (Bağlam Kaybı):** Oturum uzadıkça veya sohbet penceresi sıfırlandığında ajanın projenin amacını, mimarisini ve aldığı kararları unutması.
2. **Tahminle İlerleme (Halüsinasyon & Varsayım):** Ajanın emin olmadığı noktalarda geliştiriciye sormak yerine varsayımla kod yazıp projeyi bozması.
3. **Doğrulanmamış İddialar ("Düzelttim" Yanılsaması):** Ajanın kodu fiilen çalıştırmadan veya test etmeden "sorun çözüldü" diyerek işi kapatması.

Bu repo; bu sorunları çözmek için **disk hafızası (file-based memory)** ve **denetimli otonomi** mimarisini evrensel bir şablon seti olarak sunar.

---

## 📂 Dosya Mimarisi ve Rol Dağılımı

Herhangi bir projenin kök dizinine kopyalanarak kullanılan çekirdek standart dosyalar:

| Dosya | Görevi ve Sorumluluğu |
| :--- | :--- |
| [`TODO.md`](./TODO.md) | **Aktif Sprint & Yol Haritası:** Projenin o anki hedefleri, öncelik grupları, backlog ve iptal edilen kararlar. En üstünde projenin amacını sabitleyen bir *Bağlam Çapası (Context Anchor)* yer alır. |
| [`TODO.DONE.md`](./TODO.DONE.md) | **Doğrulanmış İş Arşivi (Changelog):** Tamamlanan tüm adımların **ters kronolojik (en yeni en üstte)** sırayla, zaman damgalı, teknik detaylı ve **çalıştırılan test/doğrulama kanıtıyla** kaydedildiği yerdir. |
| [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) | **Git & Sürüm Kontrolü Standartları:** Conventional Commits v1.0.0 (`<type>(<scope>): <mesaj>`), atomik commitler, pre-push hijyeni ve **"Commit serbest, Push izne tabi"** gatekeeping kuralı. |
| [`README.md`](./README.md) | **Proje Vitrini & Mimari:** Projenin teknik yığını, kurulumu, mimari şeması ve operasyonel komutları. |

---

## 🌍 Küresel Standartlarla Karşılaştırma

| Standart / Kuruluş | MFMX Convention Karşılığı | Nasıl Birleşti? |
| :--- | :--- | :--- |
| **Conventional Commits v1.0.0** (Angular / Google) | `GIT_STANDARDS.md` | Sadece `:` standardı benimsendi. `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `chore`, `build` tipleri ve breaking changes kuralları entegre edildi. |
| **Linux Kernel / Linus Torvalds** | Atomik Commitler | Monolitik commitler yasaklandı; her commit tek bir mantıksal değişikliği temsil eder. |
| **Keep a Changelog** | `TODO.DONE.md` | Ters kronolojik sıra kuralı korundu, üzerine yapay zekâ çağının gereği olan **çalıştırılan test komutu ve exit code kanıtı** şartı eklendi. |
| **AGENTS.md Specification** | Context Anchoring | Ajanların bağlamdan kopmaması için proje amaçları ve kuralları diske çapaladı. |

---

## 🚀 Hızlı Başlangıç (Nasıl Kullanılır?)

1. Bu repodaki [`TODO.md`](./TODO.md), [`TODO.DONE.md`](./TODO.DONE.md) ve [`GIT_STANDARDS.md`](./GIT_STANDARDS.md) dosyalarını kendi projenizin kök dizinine kopyalayın.
2. `TODO.md` dosyasının en üstündeki **Bağlam ve Amaç** kısmını projenize göre düzenleyin.
3. Yapılacak işlerinizi önceliklerine göre ilgili bölümlere yazın.
4. Yapay zekâ ajanı veya geliştirici bir işi bitirdiğinde:
   - İlgili madde `TODO.md`'den kaldırılır veya işaretlenir.
   - `TODO.DONE.md` dosyasının **en üstüne** zaman damgası, teknik özet ve doğrulama kanıtıyla işlenir.
   - Kod `GIT_STANDARDS.md` kurallarına göre atomik biçimde commitlenir; **asla izinsiz push yapılmaz**.

---

## Lisans

MIT — İstediğiniz projede serbestçe kullanabilir, çatallayabilir ve özelleştirebilirsiniz.
