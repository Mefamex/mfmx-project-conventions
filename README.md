# MFMX Project Conventions (Disiplinli Proje & Ajan Yönetim Standartları)

> **"Hafızayı sohbet geçmişine emanet etme; diske sabitle."**  
> Bu repo; modern yazılım projelerinde insan geliştiriciler ile yapay zekâ kodlama ajanlarının (Antigravity, Claude Code, OpenCode, Cursor, Codex vb.) bağlamdan kopmadan (*zero context drift*), ölçülebilir ve denetlenebilir biçimde birlikte çalışmasını sağlayan proje dokümantasyon ve iş akışı şablonlarını içerir.

---

## 📌 Neden Bu Sistem?

Büyük dil modelleri (LLM) ile çalışırken karşılaşılan en büyük 3 problem:
1. **Context Drift (Bağlam Kaybı):** Oturum uzadıkça veya sohbet penceresi sıfırlandığında ajanın projenin amacını, mimarisini ve aldığı kararları unutması.
2. **Tahminle İlerleme (Halüsinasyon & Varsayım):** Ajanın emin olmadığı noktalarda geliştiriciye sormak yerine varsayımla kod yazıp projeyi bozması.
3. **Doğrulanmamış İddialar ("Düzelttim" Yanılsaması):** Ajanın kodu fiilen çalıştırmadan veya test etmeden "sorun çözüldü" diyerek işi kapatması.

Bu repo; bu sorunları çözmek için **disk hafızası (file-based memory)** ve **denetimli otonomi** mimarisini bir şablon seti olarak sunar.

---

## 📂 Dosya Mimarisi ve Rol Dağılımı

Herhangi bir projenin kök dizinine kopyalanarak kullanılan çekirdek dosyalar:

| Dosya | Görevi ve Sorumluluğu |
| :--- | :--- |
| [`TODO.md`](./TODO.md) | **Aktif Sprint & Yol Haritası:** Projenin o anki hedefleri, öncelik grupları, backlog ve iptal edilen kararlar. En üstünde projenin amacını sabitleyen bir *Bağlam Çapası (Context Anchor)* yer alır. |
| [`TODO.DONE.md`](./TODO.DONE.md) | **Doğrulanmış İş Arşivi (Changelog):** Tamamlanan tüm adımların **ters kronolojik (en yeni en üstte)** sırayla, zaman damgalı, teknik detaylı ve **çalıştırılan test/doğrulama kanıtıyla** kaydedildiği yerdir. |
| [`README.md`](./README.md) | **Proje Vitrini & Mimari:** Projenin teknik yığını, kurulumu, mimari şeması ve operasyonel komutları. |

*(Opsiyonel İleri Seviye Dosyalar: Mimari keşifler için `NOTES.md`, asenkron soru/onay kuyruğu için `ask.md`, kapanış hijyeni için `DoLast.md`)*

---

## 🚀 Hızlı Başlangıç (Nasıl Kullanılır?)

1. Bu repodaki [`TODO.md`](./TODO.md) ve [`TODO.DONE.md`](./TODO.DONE.md) dosyalarını kendi projenizin kök dizinine kopyalayın.
2. `TODO.md` dosyasının en üstündeki **Bağlam ve Amaç** kısmını projenize göre düzenleyin.
3. Yapılacak işlerinizi önceliklerine göre ilgili bölümlere yazın.
4. Yapay zekâ ajanı veya geliştirici bir işi bitirdiğinde:
   - İlgili madde `TODO.md`'den kaldırılır veya işaretlenir.
   - `TODO.DONE.md` dosyasının **en üstüne** zaman damgası, teknik özet ve doğrulama kanıtıyla işlenir.

---

## 📜 Temel Çalışma İlkeleri

1. **Ölçülmemiş Tahminle Koda Girilmez:** Varsayımla ilerlenmez; gerekirse soru sorulur veya `ask.md` kuyruğuna yazılır.
2. **Kritik Kapılarda Denetim:** `sudo` gerektiren komutlar, dosya/veri silme (`rm`), `git push` adımları ve üçüncü kişilere mesaj gönderimi geliştiricinin kontrolündedir.
3. **Fiilî Doğrulama Şartı:** Bir görevin tamamlandı sayılması için derleme (`build`), test veya canlı kontrol çıktısı (exit code 0) `TODO.DONE.md` dosyasına kanıt olarak eklenmelidir.
4. **Sıfır Kalıntı:** Geliştirme sonrası geçici test dosyaları, process'ler ve log artıkları temizlenir.

---

## Lisans

MIT — İstediğiniz projede serbestçe kullanabilir, çatallayabilir ve özelleştirebilirsiniz.
