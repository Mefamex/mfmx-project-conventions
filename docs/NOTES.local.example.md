# NOTES.local — Gizli / Yerel Notlar

> **Bu dosya nedir:** Repoya girmemesi gereken, projeye ya da bu makineye özel notlar. Bu dosya **şablondur** ve repoda izlenir; gerçek notlar `docs/NOTES.local.md` kopyasına yazılır. `make install` dosya yoksa bu şablondan oluşturur, `.gitignore` ve pre-commit hook onu commit'ten korur.  
> **Girer:** Yerel yollar, iç ağ adresleri ve makine adları, kişi / müşteri / paydaş adları, gizli bağlam ve kararlar, bir secret'ın **nerede durduğu** ("API token parola yöneticisinde, `proje-x` kaydında").  
> **Girmez:** Secret'ın **kendisi** (şifre, token, anahtar, kart / IBAN). Bu dosya şifreli değildir; diskte, yedeklerde ve senkron klasörlerinde düz metin durur. Secret'lar `.env` veya parola yöneticisinde tutulur. AI ajanından da gizli kalması gereken bilgi de buraya yazılmaz; ajan bu dosyayı okur.

> **Ajan ve Geliştirici Kuralları:**  
> 1. **Oku, Dışarı Taşıma:** Bu dosya bağlam için okunur. İçeriği izlenen hiçbir dosyaya, commit mesajına, PR / issue açıklamasına veya `CHANGELOG.md`'ye kopyalanmaz, özetlenmez, alıntılanmaz. Genel bir ders çıkarsa kişisel ayrıntı ayıklanıp `docs/NOTES.md`'ye yazılır.  
> 2. **Tam Yolla Oku:** Dosya `.gitignore`'da olduğu için arama araçları (ripgrep vb.) onu göstermez. Ajan `docs/NOTES.local.md` yolunu doğrudan açarak okur.  
> 3. **Worktree'de Yok:** Yeni bir `git worktree` veya taze klon bu dosyayı içermez. Worktree'de çalışırken ana çalışma klasöründeki `docs/NOTES.local.md` tam yoluyla okunur.  
> 4. **Silme Tehlikesi:** `git clean -x` ve `git clean -X` bu dosyayı geri dönüşsüz siler. Bu komutlar önce `-n` ile denenir ve kullanıcı onayı olmadan çalıştırılmaz.  
> 5. **Yedek Senin Sorumluluğunda:** Dosya git geçmişinde yoktur; bilgisayar kaybolursa notlar da kaybolur. Önemli notlar ayrıca yedeklenir.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Yerel Ortam ve Yollar
*Bu makineye özel klasör yolları, yerel servis adresleri ve portlar, makine / kullanıcı adları:*

- **[Ortam veya servis adı]:** [Yol, adres veya port; ne için kullanıldığı]

---

## 2. Erişim Notları
*Bir sisteme nasıl erişildiği ve secret'ın NEREDE durduğu (secret'ın kendisi asla):*

- **[Sistem / hesap adı]:** [Erişim yolu (VPN, jump host, panel) ve kimlik bilgisinin tutulduğu yer]

---

## 3. Kişiler ve Paydaşlar
*Projeyle ilgili kişi, ekip veya müşteri adları ve rolleri:*

- **[Kişi / kurum adı]:** [Rolü, hangi konuda muhatap olduğu]

---

## 4. Gizli Bağlam ve Kararlar
*Repoda görünmemesi gereken iş bağlamı, ticari / kişisel gerekçeler, gizli tutulan kararlar:*

- **[YYYY-MM-DD] — [Konu]:** [Bağlam veya kararın kendisi ve gerekçesi]

---

## 5. Kişisel Hatırlatmalar
*Sadece senin için olan, projeyle ilgili kısa notlar:*

- **[Hatırlatma]:** [Ayrıntı]
