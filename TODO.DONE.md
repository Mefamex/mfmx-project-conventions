# TODO.DONE — [Proje Adı]

> **Kayıt Kuralları:**  
> 1. **Ters Kronolojik:** En son tamamlanan iş daima **en yukarıya** eklenir.  
> 2. **Kanıt Şartı:** Her kayıtta yapılan işlemle birlikte **çalıştırılan test/komut ve sonucu** (exit code 0, test sayısı, ekran/log çıktısı) yer almalıdır.  
> 3. **TODO.md Eşzamanlılığı:** Buraya eklenen iş, [`TODO.md`](./TODO.md) listesinden kaldırılır veya işaretlenir.

---

### [YYYY-MM-DD HH:MM] — [Görev Başlığı 2]
- **Değişiklikler:** `src/core/example.py` dosyasına dinamik süre sayacı eklendi. Aktif model vurgusu için CSS bileşeni güncellendi.
- **Kök Neden / Problem:** Statik etiketler nedeniyle anlık kalan süre kullanıcıya yansımıyordu.
- **Doğrulama Kanıtı:** `pytest tests/test_example.py -v` → **3 passed in 0.12s (Exit code: 0)**. Süreç canlı ortamda test edildi, bellek kaçağı yok.

---

### [YYYY-MM-DD HH:MM] — [Görev Başlığı 1]
- **Değişiklikler:** Proje iskeleti ve merkezi konfigürasyon motoru kuruldu (`config.yaml` ve `.env` desteği).
- **Kök Neden / Problem:** Dağınık ayar dosyaları tek çatı altında toplandı.
- **Doğrulama Kanıtı:** `python main.py --dry-run` başarıyla çalıştı. `ruff check .` ve `mypy .` temiz geçti (0 hata).
