# TODO.DONE — [Proje Adı Buraya Gelecek]

> **Kayıt Mantığı ve Arşivleme Kuralı:**  
> 1. **Ters Kronolojik Sıra:** En son tamamlanan iş daima **en yukarıya** eklenir. Dosyanın üstü projenin en güncel durumunu gösterir.  
> 2. **Kanıt Zorunluluğu:** Her kayıtta "ne yapıldığı" kadar **"hangi test veya komutla doğrulandığı"** (exit code, test sayısı, ekran/log çıktısı) açıkça yazılmalıdır.  
> 3. **TODO.md Senkronizasyonu:** Buraya eklenen iş, eşzamanlı olarak [`TODO.md`](./TODO.md) listesinden kaldırılır veya tamamlandı olarak işaretlenir.

---

### [YYYY-MM-DD HH:MM] — [Örnek Görev 2 Başlığı]
- **Yapılan Değişiklikler:**
  - `src/core/example.py` dosyasına dinamik süre hesaplama fonksiyonu eklendi.
  - Arayüz bileşeninde aktif durumu vurgulayan yeni renk sınıfı tanımlandı.
- **Kök Neden / Çözülen Problem:**
  - Önceki sürümde statik etiketler kullanıldığı için kullanıcı anlık kalan süreyi göremiyordu.
- **Test ve Doğrulama Kanıtı:**
  - Birim testler koşturuldu: `pytest tests/test_example.py -v` → **3 passed in 0.12s (Exit code: 0)**.
  - Canlı süreç üzerinde bellek sızıntısı ve CPU tüketimi izlendi; ek yük gözlemlenmedi.

---

### [YYYY-MM-DD HH:MM] — [Örnek Görev 1 Başlığı]
- **Yapılan Değişiklikler:**
  - Proje mimarisinin ilk çekirdek modülleri ve konfigürasyon motoru kuruldu.
  - Ortam değişkenleri için `.env` ve `config.yaml` okuma katmanı yazıldı.
- **Kök Neden / Çözülen Problem:**
  - Dağınık ayarlardan kaynaklanan yapılandırma karmaşası tek merkezde toplandı.
- **Test ve Doğrulama Kanıtı:**
  - `python main.py --dry-run` başarıyla çalıştırıldı ve beklenen konfigürasyon çıktısı üretildi.
  - Lint ve tip kontrolü: `ruff check .` ve `mypy .` temiz geçti (0 hata).
