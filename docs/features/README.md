# FEATURES — Özellik Belgeleri Dizini

> **Amaç:** Bir özellik üzerinde çalışmaya başlayan kişi (insan ya da AI ajanı) "Bu özellik bugün nasıl çalışıyor, neye dikkat etmeliyim?" sorusunun cevabını tek dosyada bulur. Böylece NOTES, TODO.DONE ve ASKED'e dağılmış bilgiyi toplamak ya da ilgisiz yüzlerce satırı okumak gerekmez.  
> **Zorunluluk:** İsteğe bağlıdır. Proje 4 veya daha fazla özelliğe ulaştığında ya da tek bir özelliğin bilgisi 3 veya daha fazla belgeye dağılmaya başladığında açılır. Küçük, tek amaçlı projelerde bu klasör hiç kopyalanmaz.

> **Kurallar:**  
> 1. **Özellik Nedir:** Kullanıcının adıyla andığı, kendi başına anlatılabilen bir yetenektir (ör. bir bildirim hattı, bir kanal entegrasyonu). Veri / makine öğrenmesi projelerinde hattın aşamaları (veri, eğitim, demo) da özellik sayılır. Tek bir fonksiyon, sınıf veya modül özellik değildir; onlar özellik dosyasının "İlgili Dosyalar" bölümünde geçer.  
> 2. **Bir Özellik = Bir Dosya:** Her özellik [`_SABLON.md`](./_SABLON.md) kopyalanarak `docs/features/<ozellik-adi>.md` adıyla açılır. Ad en fazla 3 kelime, ASCII, kebab-case olur (`gorsel-hatti`, `zamanli-mesaj`). Türkçe karakter kullanılmaz.  
> 3. **Bugünkü Hâl, Tarihçe Değil:** Özellik dosyası özelliğin **şu anki** davranışını anlatır. Ne zaman ne yapıldığı [`../TODO.DONE.md`](../TODO.DONE.md)'de, kararlar [`../ASKED/`](../ASKED/) altında, açık işler [`../TODO.md`](../TODO.md)'de kalır. Özellik dosyası bunlara link verir, içeriklerini kopyalamaz.  
> 4. **Gizli Kısım Ayrı Dosyada:** Özelliğe ait ama repoya girmemesi gereken maddeler (kişi adı, hesap kimliği, iç adres, MAC / IP adresi, kullanıcı adı, makineye özel yol) `docs/features/<ozellik-adi>.local.md` dosyasına yazılır. Bu dosya yalnızca gerçekten gizli içerik varsa açılır. `.gitignore` ve pre-commit hook onu commit'ten korur. Projenin geneline ait gizli notlar ise `docs/NOTES.local.md`'de kalır. Kuralları `NOTES.local` ile aynıdır: tam yoluyla okunur, içeriği izlenen dosyalara, commit / PR metnine veya CHANGELOG'a taşınmaz, secret'ın kendisi yazılmaz.  
> 5. **Aynı Commit'te Güncelle:** Bir özelliğin davranışını, ayarını, sınırını veya test yolunu değiştiren commit, o özelliğin dosyasını da **aynı commit'te** günceller. Değişiklik depo dışında yapıldıysa (`/etc/...` gibi sistem dosyaları; dosyanın "İlgili Dosyalar" bölümündeki "Depo dışı" listesi), özellik dosyası o değişiklikten hemen sonra ayrı bir commit'le güncellenir. Yeni özellik eklenince, adı değişince veya özellik kaldırılınca aşağıdaki dizin de aynı commit'te güncellenir. Kaldırılan özelliğin dosyası silinir; neden kaldırıldığı TODO.DONE kaydına yazılır.  
> 6. **Ajan Okuma Sırası:** Ajan oturum başında bu dizini okur ve yalnızca üzerinde çalışacağı özelliğin dosyasını açar. Diğer özellik dosyalarını okumaz. Dosyanın başındaki "Doğrulama komutu"nu çalıştırarak dosyanın güncel olduğunu teyit eder ve "Değişmez Kurallar (YAPMA)" bölümüne uyar. "Gizli" sütununda `Var` yazıyorsa ilgili `.local.md` dosyasını tam yoluyla okur (arama araçları gitignore'lu dosyaları göstermez; yeni worktree ve taze klonda bu dosya bulunmaz, ana çalışma klasöründen okunur).  
> 7. **Dizin Satırı:** Her özellik aşağıdaki tabloda tek satırdır. Durum şu değerlerden biridir: `Aktif` (kullanımda), `Deneysel` (çalışıyor ama değişebilir), `Park` (geçici olarak durduruldu). Gizli sütunu `Var` veya `Yok` olur.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## Dizin

<!-- Her özellik için bu tabloya bir satır ekleyin. Özellik sütunu özellik dosyasına link verir; Ne Yapar sütunu bağlamı bilmeyen birinin anlayacağı tek cümledir. -->

| Özellik | Ne Yapar (tek cümle) | Durum | Gizli |
| :--- | :--- | :--- | :--- |
