# TODO — [Proje Adı Buraya Gelecek]

> **Bağlam ve Amaç (Context Anchor):**
> [Bu projenin temel amacı, hedeflediği nihai çıktı ve mevcut odak noktası nedir? Buraya 2-4 cümlelik net ve somut bir özet yazın. Ajan veya geliştirici yeni oturuma başladığında projeyi buradan anlar.]

---

## 📋 Ajan ve Geliştirici İçin Çalışma Kuralları

1. **Sırayla İlerle:** Aktif geliştirme sırasındaki işleri yukarıdan aşağıya doğru ele al. Kapsamı aşan veya listede olmayan işlere sormadan dallanma.
2. **Tahmin Etme, Doğrula:** Kodda varsayımla ilerleme; gerekirse soru sor veya açık soruları `ask.md` / `NOTES.md` içine not düş.
3. **Kritik Kapılarda Dur:** `sudo`, veri silme (`rm`), mimari kırılma riski taşıyan adımlar veya `git push` izinsiz çalıştırılamaz.
4. **TODO'dan DONE'a Aktarma Kuralı:**
   - Bir görev tamamlandığında, `TODO.md` listesinden silinir veya `[x]` olarak işaretlenir.
   - Detaylı teknik açıklaması ve doğrulama kanıtıyla birlikte [`TODO.DONE.md`](./TODO.DONE.md) dosyasının **en üstüne (ters kronolojik)** aktarılır.
5. **Fiilî Test Kanıtı:** Çalıştığını test komutuyla (`pytest`, `pnpm build`, `cargo test`, canlı curl/log) kanıtlamadığın hiçbir işi tamamlandı sayma.

---

## 🚀 1. Aktif Geliştirme Sırası (Active Sprint)
*Şu anda üzerinde çalışılan veya bir sonraki ilk adımda ele alınacak acil görevler:*

- [ ] **1. [Görev Başlığı]:**
  - [ ] Alt adım veya teknik gereksinim 1
  - [ ] Alt adım veya teknik gereksinim 2
  - Beklenen çıktı / başarı kriteri: `...`

- [ ] **2. [Görev Başlığı]:**
  - [ ] Alt adım veya teknik gereksinim 1
  - Beklenen çıktı / başarı kriteri: `...`

---

## 📌 2. Yüksek Öncelikli İşler (High Priority)
*Aktif sprint sonrasında ele alınması gereken kritik maddeler:*

- [ ] **[Kritik Özellik / Düzeltme]:**
  - Açıklama ve detaylar.
- [ ] **[Performans veya Mimari İyileştirme]:**
  - İlgili dosyalar ve yapılması gerekenler.

---

## 🛠️ 3. Orta & Düşük Öncelik (Backlog)
*Sistemi zenginleştirecek ancak aciliyeti olmayan geliştirmeler:*

- [ ] **[Özellik Başlığı]:** Detaylı açıklama.
- [ ] **[Refaktör / Dokümantasyon]:** Kod içi temizlik veya ek rehber hazırlığı.

---

## 🔮 4. Gelecek Yol Haritası (Future Roadmap)
*İlerleyen sürümlerde değerlendirilmek üzere kenara not edilen fikirler:*

- [ ] **[Gelecek Fikri 1]:** İleride entegre edilebilecek harici servisler veya ek modüller.
- [ ] **[Gelecek Fikri 2]:** İhtiyaç duyulursa ele alınacak genişletmeler.

---

## ❌ 5. İptal Edilenler / Kapsam Dışı (Rejected)
*Tartışılmış ancak projenin sadeliği veya mimari tercihler gereği vazgeçilmiş kararlar (aynı şeyi tekrar tartışmamak için tutulur):*

- ~~**[Vazgeçilen Özellik Adı]:**~~ İptal gerekçesi (Örn: Arayüzü gereksiz karmaşıklaştırdığı veya harici kütüphane bağımlılığı yarattığı için iptal edildi).
