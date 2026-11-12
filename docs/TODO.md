# TODO — [Proje Adı]

> **Bağlam ve Amaç (Context Anchor):**
> [Projenin çekirdek amacı, nihai çıktısı ve anlık odak noktası (2-3 net cümle). Ajan her oturumda ilk burayı okur.]

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## Ajan ve Geliştirici Kuralları

- **Sıralı İlerleme:** Aktif sprint listesini yukarıdan aşağıya takip et; kapsama girmeyen yan işlere dallanma.
- **Tahmin Yasak:** Varsayımla koda girme; açık kararları `ASK.md` veya `NOTES.md`'ye yönlendir.
- **Kırmızı Çizgiler:** `sudo`, veri silme (`rm`), kontrolsüz refaktör veya `git push` izinsiz çalıştırılamaz. Silme için onaylı yol `Makefile`'daki `clean` / `remove` hedefleridir.
- **Arşivleme Kuralı:** Biten madde `TODO.md`'den çıkarılır; zaman damgası ve test kanıtıyla [`docs/TODO.DONE.md`](./TODO.DONE.md)'nin en üstüne eklenir.
- **Doğrulama Şartı:** `build`, `test`, `lint` veya canlı çalışma kanıtı (exit code 0) sunulmadan görev tamamlanamaz.
- **Hızlı Girişi Önce İşle:** Oturum başında "Geliştirici Hızlı Girişi" boş değilse, başka işe geçmeden önce her maddeyi işle:
  1. Aciliyet ve Önem boşsa kendin değerlendir; emin değilsen `ASK.md`'ye soru aç ve madde orada beklesin.
  2. Maddeyi doğru yere taşı:
     - Aciliyet Yüksek + Önem Yüksek → Aktif Sprint
     - Aciliyet Yüksek + Önem Orta/Düşük → Aktif Sprint'in sonuna, küçük ve hızlı biten iş olarak
     - Önem Yüksek + Aciliyet Orta/Düşük → Yüksek Öncelik
     - İkisi de Orta → Backlog
     - Biri Düşük, diğeri en fazla Orta → Gelecek Yol Haritası (gereksiz görünüyorsa geliştiriciye sorup İptal)
     - Görev değilse doğru dosyaya: karar sorusu → `ASK.md`, öğrenilen kısıt / not → `NOTES.md`
  3. Taşınan maddeyi buradan sil. Bu bölüm normalde **boş** durur.

---

## 1. Geliştirici Hızlı Girişi (Inbox)
*Aniden gelen, henüz planlanmamış veya nereye yazılacağına karar verilmemiş fikirler. Geliştirici buraya hızlıca yazar; ajan yukarıdaki "Hızlı Girişi Önce İşle" kuralıyla değerlendirip doğru yere taşır. Normalde boştur.*

- **[Fikrin kısa adı]:** [Aklına gelen şey, kaç kelimeyle olursa]
  - Aciliyet: [Yüksek / Orta / Düşük — boş bırakılabilir, ajan değerlendirir]
  - Önem: [Yüksek / Orta / Düşük — boş bırakılabilir, ajan değerlendirir]

---

## 2. Aktif Sprint (Active Sprint)
*Şu anda üzerinde çalışılan / ilk ele alınacak acil görevler:*

- [ ] **1. [Görev Başlığı]:**
  - [ ] Alt adım / teknik gereksinim 1
  - [ ] Alt adım / teknik gereksinim 2
  - Hedef çıktı / kriter: `...`

- [ ] **2. [Görev Başlığı]:**
  - [ ] Alt adım / teknik gereksinim
  - Hedef çıktı / kriter: `...`

---

## 3. Yüksek Öncelik (High Priority)
*Aktif sprint biter bitmez sırada bekleyen kritik maddeler:*

- [ ] **[Kritik Özellik / Düzeltme]:** Açıklama ve ilgili dosya yolları.
- [ ] **[Mimari / Performans]:** Çözülmesi gereken darboğaz.

---

## 4. Backlog (Medium & Low Priority)
*Sistemi tamamlayıcı, aciliyeti olmayan geliştirmeler:*

- [ ] **[Özellik Başlığı]:** Detaylar.
- [ ] **[Refaktör / Dokümantasyon]:** Kod temizliği veya rehber güncellemeleri.

---

## 5. Gelecek Yol Haritası (Future Roadmap)
*İleride değerlendirilecek fikir ve genişletmeler:*

- [ ] **[Entegrasyon / İleri Fikir 1]:** İhtiyaç halinde eklenecek harici servis veya araçlar.
- [ ] **[Gelişmiş Özellik 2]:** Uzun vadeli mimari fikirler.

---

## 6. İptal / Kapsam Dışı (Rejected)
*Tartışılmış ancak sadelik, maliyet veya mimari tercih gereği vazgeçilmiş kararlar (tekrar gündeme gelmemesi için gerekçesiyle tutulur):*

- ~~**[Vazgeçilen Özellik Adı]:**~~ [İptal gerekçesi: neden vazgeçildi (maliyet, karmaşıklık, mimariye uymama) ve hangi koşulda tekrar düşünülebileceği].
