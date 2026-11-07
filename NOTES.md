# NOTES — Dahili Teknik Notlar ve Mimari Kararlar

> **Amaç:** Kod içine yorum kalabalığı yapmadan; denenip vazgeçilen yaklaşımları (*discarded approaches*), donanım/performans kısıtlarını, protokol detaylarını ve "Neden böyle yapıldı?" gerekçelerini diske sabitlemektir.

---

## 1. Geliştirme Tarihçesi ve Vazgeçilen Yollar (Discarded Approaches)

Gelecekte aynı hatalı patikalara tekrar girmemek için denenmiş ve elenmiş yöntemler:

- **[Yöntem / Kütüphane Adı]:**
  - *Neden denendi:* [Örn: Sistem komutlarını subprocess ile çağırmak hızlı görünmüştü.]
  - *Neden vazgeçildi:* [Örn: Yüksek eşzamanlılıkta kilitlenmelere ve timeout sorunlarına yol açtı; yerel kütüphaneye geçildi.]
- **[Alternatif Mimari]:**
  - *Neden elendi:* [Örn: Bellek tüketimi 8 GB VRAM sınırını aştığı için int8 kuantizasyon modeline dönüldü.]

---

## 2. Donanım, Ortam ve Performans Bulguları (Verified Benchmarks)

Sistem üzerinde bizzat test edilmiş ve doğrulanmış limitler:

| Bileşen / Kriter | Doğrulanmış Değer | Notlar & Sınırlar |
| :--- | :--- | :--- |
| **Örnekleme / Hız Limiti** | 50-80 istek/sn | Üzerindeki yüklerde hedef sunucu servis kısıtlamasına (SERVFAIL/Rate Limit) giriyor. |
| **Bellek / Kuantizasyon** | `int8_float16` | Minimum VRAM kaybıyla FP16 doğruluğuna en yakın optimum denge noktası. |
| **Zaman Aşımı (Timeout)** | 3 saniye (2 retry) | Yanıt vermeyen düğümler için askıda kalmayı engelleyen tavan süre. |

---

## 3. Mimari Kısıtlar ve Davranış Tabloları

Kodun çalışma mantığını belirleyen sınır durumları (*edge cases*):

| Durum / Girdi | Sistem Davranışı | Gerekçe / Neden? |
| :--- | :--- | :--- |
| **Servis Çöküşü (OOM)** | Otomatik CPU fallback | Sürecin kesilmeden düşük hızda da olsa devam edebilmesi için. |
| **1. Ctrl+C (SIGINT)** | Graceful shutdown | Mevcut durumun `progress.json`'a güvenle yazılması için. |
| **2. Ctrl+C (Force)** | Anında sonlandırma | Kullanıcının kesin çıkış iradesine saygı duymak için. |

---

## 4. Konfigürasyon Hiyerarşisi

Sistemdeki tüm ayarlar şu katı öncelik sırasıyla okunur:
1. **Ortam Değişkeni (`APP_*`):** En yüksek öncelik.
2. **Yapılandırma Dosyası (`config.yaml`):** Kullanıcı tanımlı değerler.
3. **Dahili Kod İçi Varsayılan (Default):** Dosya silinse bile çökmeyi engelleyen emniyet değerleri.
