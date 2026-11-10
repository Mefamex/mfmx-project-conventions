# TODO — [Proje Adı]

> **Bağlam ve Amaç (Context Anchor):**
> [Projenin çekirdek amacı, nihai çıktısı ve anlık odak noktası (2-3 net cümle). Ajan her oturumda ilk burayı okur.]

---

## Ajan ve Geliştirici Kuralları

- **Sıralı İlerleme:** Aktif sprint listesini yukarıdan aşağıya takip et; kapsama girmeyen yan işlere dallanma.
- **Tahmin Yasak:** Varsayımla koda girme; açık kararları `ASK.md` veya `NOTES.md`'ye yönlendir.
- **Kırmızı Çizgiler:** `sudo`, veri silme (`rm`), kontrolsüz refaktör veya `git push` izinsiz çalıştırılamaz. Silme için onaylı yol `Makefile`'daki `clean` / `remove` hedefleridir.
- **Arşivleme Kuralı:** Biten madde `TODO.md`'den çıkarılır; zaman damgası ve test kanıtıyla [`docs/TODO.DONE.md`](./docs/TODO.DONE.md)'nin en üstüne eklenir.
- **Doğrulama Şartı:** `build`, `test`, `lint` veya canlı çalışma kanıtı (exit code 0) sunulmadan görev tamamlanamaz.

---

## 1. Aktif Sprint (Active Sprint)
*Şu anda üzerinde çalışılan / ilk ele alınacak acil görevler:*

- [ ] **1. [Görev Başlığı]:**
  - [ ] Alt adım / teknik gereksinim 1
  - [ ] Alt adım / teknik gereksinim 2
  - Hedef çıktı / kriter: `...`

- [ ] **2. [Görev Başlığı]:**
  - [ ] Alt adım / teknik gereksinim
  - Hedef çıktı / kriter: `...`

---

## 2. Yüksek Öncelik (High Priority)
*Aktif sprint biter bitmez sırada bekleyen kritik maddeler:*

- [ ] **[Kritik Özellik / Düzeltme]:** Açıklama ve ilgili dosya yolları.
- [ ] **[Mimari / Performans]:** Çözülmesi gereken darboğaz.

---

## 3. Backlog (Medium & Low Priority)
*Sistemi tamamlayıcı, aciliyeti olmayan geliştirmeler:*

- [ ] **[Özellik Başlığı]:** Detaylar.
- [ ] **[Refaktör / Dokümantasyon]:** Kod temizliği veya rehber güncellemeleri.

---

## 4. Gelecek Yol Haritası (Future Roadmap)
*İleride değerlendirilecek fikir ve genişletmeler:*

- [ ] **[Entegrasyon / İleri Fikir 1]:** İhtiyaç halinde eklenecek harici servis veya araçlar.
- [ ] **[Gelişmiş Özellik 2]:** Uzun vadeli mimari fikirler.

---

## 5. İptal / Kapsam Dışı (Rejected)
*Tartışılmış ancak sadelik, maliyet veya mimari tercih gereği vazgeçilmiş kararlar (tekrar gündeme gelmemesi için gerekçesiyle tutulur):*

- ~~**[Vazgeçilen Özellik Adı]:**~~ [İptal gerekçesi: neden vazgeçildi (maliyet, karmaşıklık, mimariye uymama) ve hangi koşulda tekrar düşünülebileceği].
