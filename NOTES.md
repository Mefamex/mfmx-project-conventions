# NOTES — Dahili Teknik Bellek ve Mühendislik Notları

> **Temel Felsefe:**  
> Kod dosyaları bir işin **"nasıl"** yapıldığını anlatır; git geçmişi **"ne zaman"** yapıldığını gösterir; `NOTES.md` ise o kodun **"neden"** o şekilde yazıldığını ve **"hangi alternatiflerin neden elendiğini"** açıklar.  
> Kod içine paragraflarca yorum satırı yığmak yerine, mimarinin görünmeyen kısıtları ve tecrübeleri burada diske sabitlenir.

---

## 🧭 Bu Dosyanın Amacı ve Kapsamı

1. **Görünmeyen Kısıtları Belgelemek:** Kodun kendisine bakarak anlaşılamayacak donanım sınırları, API kotaları, protokol tuzakları ve platform gariplikleri burada yaşar.
2. **Çıkmaz Sokakları Kaydetmek:** Gelecekte bir ajanın veya geliştiricinin *"şunu şöyle yapsak daha iyi olmaz mı?"* diyerek daha önce denenmiş ve çökmüş bir yöntemi tekrar denemesini engeller.
3. **Akıl Yürütme Hafızası (Rationale):** Mimari bir kararın hangi bedel (trade-off) kabul edilerek alındığını kaydeder.

---

## ⚡ Bu Dosya Ne Zaman Güncellenir? (Tetikleyici Olaylar)

Yapay zekâ ajanları ve yazılımcılar aşağıdaki durumlar gerçekleştiğinde bu dosyayı güncellemekle yükümlüdür:

1. **Bir Alternatiften Vazgeçildiğinde:** Bir kütüphane, algoritma veya mimari yöntem denenip başarısız olduğunda veya elendiğinde (hemen *"Elenen Alternatifler"* altına gerekçesiyle yazılır).
2. **Beklenmeyen Bir Hata/Gariplik Çözüldüğünde:** Belgelerde yazmayan bir işletim sistemi, kütüphane veya ağ garipliği keşfedilip etrafından dolanıldığında (workaround).
3. **Kritik Bir Eşik Ölçüldüğünde:** Tahmin değil; bizzat çalıştırılarak bir hız limiti, VRAM tavanı, timeout süresi veya eşzamanlılık sınırı test edilip doğrulandığında.
4. **Mimari Bir Tercih Kesinleştiğinde:** Projenin omurgasını etkileyen iki seçenek arasında bir seçim yapıldığında (örneğin: senkron worker vs asenkron döngü, Cloudflare Worker vs Node sunucusu).

---

## 🤖 Yapay Zekâ (AI) Ajanları İçin Çalışma Protokolü

- **Dokunmadan Önce Oku:** Projede büyük bir refaktör yapmadan, yeni bir kütüphane önermeden veya performans iyileştirmesine girişmeden önce **bu dosyayı mutlaka oku**. Burada elendiği yazan bir yöntemi kullanıcıya asla yeni bir çözüm gibi sunma.
- **Öğrendiğin Kısıtı Sabitle:** Kullanıcı sana projeye veya sisteme dair özel bir kural, donanım sınırı veya davranış öğrettiğinde bunu sohbet geçmişinde bırakma; hemen bu dosyaya uygun başlık altında işle.
- **Tarihsel Hafızayı Silme:** Yeni bir not eklerken geçmişte yazılmış mimari kararları ve tecrübeleri silme veya ezme. Bir karar değiştiyse, eski kararın altına *"Revizyon: Artık X yerine Y kullanılıyor çünkü..."* notu düş.

---

## 📂 Her Projeye Uyarlanabilir Not Başlıkları

*Aşağıdaki başlıklar projenin türüne (CLI, Web, AI, Gömülü Sistem, API vb.) göre esnek şekilde kullanılır:*

### 1. Mimari Tercihler ve Gerekçeler (Architecture Decisions & Trade-offs)
*Burada; projede seçilen temel yapılar ve bu seçimin teknik gerekçeleri yer alır. Her mimari karar bir kazanç sağlarken bir ödün (trade-off) verir. Neden bu ödünün kabul edildiği açıklanmalıdır.*

### 2. Denenip Vazgeçilen Yollar (Discarded Approaches)
*Burada; geliştirme sürecinde bizzat test edilmiş ancak yetersizlik, deadlock, yüksek bellek tüketimi veya API kısıtlaması nedeniyle terk edilmiş yollar listelenir. Aynı çukura tekrar düşülmesini engeller.*

### 3. Doğrulanmış Sistem Sınırları ve Eşikler (Verified Constraints)
*Burada; varsayımlar değil, bizzat ölçülmüş parametreler yer alır (Örn: Güvenli istek/saniye limiti, donanım kaynak sınırları, zaman aşımı süreleri, paket boyutu tavanı).*

### 4. Platform Gariplikleri ve Tuzaklar (Quirks & Gotchas)
*Burada; kullanılan işletim sistemi, üçüncü parti servisler, derleyiciler veya kütüphanelerin dokümante edilmemiş tuhaf davranışları ve bunlara karşı geliştirilen emniyet ağları anlatılır.*

### 5. Sahadan Süzülen İlkeler (Lessons Learned & Heuristics)
*Burada; projenin bizzat geliştirilmesi ve çalıştırılması esnasında edinilen, gelecekteki kodlama adımlarına yön verecek kısa ve değişmez kurallar maddelenir.*
