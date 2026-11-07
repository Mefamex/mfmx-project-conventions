# ASK — Açık Sorular ve Karar Kuyruğu

> **Temel İlke:** "Ölçülmemiş bir tahminle koda girmek yok."  
> Bu dosya; mimari kararlar, yetki sınırları veya belirsizlik içeren konularda geliştiricinin yanıtını bekleyen açık soruları toplar.  
> Cevaplanan sorular arşivlenir (`docs/archive/` altına), aksiyon maddeleri ise [`TODO.md`](./TODO.md) listesine aktarılır.

---

## 📋 Ajan İçin Soru & Karar Kuralları

1. **Varsayımla Kodlama Yasaktır:** İki farklı yol varsa ve tercih kritikse tahminle ilerleme; soruyu buraya net seçeneklerle yaz.
2. **Kendi Kararım (Inisiyatif İlkesi):** Geliştirici otonomi vermişse (*"kararı sen ver ve devam et"*), kararı uygula ancak bu dosyaya `KENDİ KARARIM` başlığı altında **seçimini ve gerekçeni** tablo halinde kaydet.
3. **Arşivleme Kuralı:** Yanıtlanan sorular bu dosyayı şişirmemeli; `docs/archive/YYYY-MM-DD-ask-[konu].md` dosyasına taşınarak temizlenmelidir.

---

## 🔴 1. Acil Karar Bekleyenler (Bloklayıcılar / Blocking)
*Geliştiriciden yanıt gelmeden koda dokunulmaması gereken açık sorular:*

### Soru 1: [Konu / Modül Başlığı]
- **Durum / Sorun:** [Mevcut durum veya ortaya çıkan mimari ikilem]
- **Seçenek A:** [Seçenek 1 — Avantaj/Dezavantaj]
- **Seçenek B:** [Seçenek 2 — Avantaj/Dezavantaj]
- **Ajanın Önerisi:** [Ajanın teknik gerekçesiyle tavsiye ettiği yol]
- **Geliştirici Yanıtı:** *(Bekleniyor)*

---

## 🧠 2. Kendi Kararım (Ajanın Otonom Aldığı Kararlar)
*Geliştirici yokken ajanın inisiyatif alıp uyguladığı, gerekçelendirilmiş tercihler:*

### [YYYY-MM-DD HH:MM] — [Karar Konusu]

| Parametre / Alan | Seçilen Karar | Gerekçe / Neden Bu Yol Seçildi? |
| :--- | :--- | :--- |
| **Ölçüt / Eşik** | `...` | [Gerekçe: örn. Sistem yükünü minimize etmek için] |
| **Hata Davranışı** | `...` | [Gerekçe: örn. Yanlış veri yazmaktansa sessizce durmayı tercih etti] |
| **Bağımlılık** | `...` | [Gerekçe: örn. Ekstra kütüphane yerine dahili modül kullanıldı] |

---

## ⏸ 3. Ertelenmiş / Kullanımda Görülecekler (Deferred)
*Şu an koda engel olmayan, canlı kullanım tecrübesine veya ilerleyen fazlara bırakılan konular:*

- **[Konu 1]:** *"Kullanım deneyimine göre bakalım"* — Şimdilik varsayılan davranışta bırakıldı.
- **[Konu 2]:** İleride gerekirse tek bir `bool` ayarıyla açılmak üzere kapalı tutuldu.
