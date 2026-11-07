# Git & Commit Standartları (Definitive Specification)

> **Amaç:** Bu belge; projelerde çalışan tüm insan geliştiriciler, Yapay Zekâ (AI) kodlama ajanları (Antigravity, Claude Code, Cursor, OpenCode, Codex) ve CLI araçları için **değişmez Git ve GitHub kurallarını** tanımlar.
> Bir geliştirici veya ajanın depoya dokunmadan önce bu kuralları okuması ve harfiyen uygulaması zorunludur.

---

## 1. Altın Kural: Commit Serbest, Push İzne Tabi (Gatekeeping)

```
[ Lokal Geliştirme ] ──> [ Atomik Commit ] ──> [ Güvenlik / Hijyen Kontrolü ] ──> [ KULLANICI ONAYI ] ──> [ git push ]
```

1. **Lokal Commit Serbest ve Teşviktir:**
   - Tamamlanan her mantıksal adım, refaktör veya düzeltme lokalde hemen commitlenebilir. Küçük ve atomik commitler rollback (geri alma) ve incelemeyi kolaylaştırır.
2. **Push Kullanıcı Onayına Tabidir:**
   - **HİÇBİR YAPAY ZEKÂ AJANI KULLANICIDAN AÇIK "PUSH'LA" ONAYI ALMADAN `git push` ÇALIŞTIRAMAZ.**
   - Bir commit remote'a gönderildiğinde kamuya veya canlı üretim hatlarına (Cloudflare, Vercel, VPS vb.) yansır. Bu nedenle push yetkisi daima insan denetimindedir.
3. **Force Push Yasağı:**
   - `git push --force` veya `-f` kesinlikle yasaktır (kullanıcı açık ve yazılı talimat vermedikçe).

---

## 2. Commit Mesaj Formatı (Conventional Commits Standardı)

Commit mesajlarında Angular, Google ve küresel açık kaynak ekosisteminin benimsediği **Conventional Commits v1.0.0** standardı (`:`) kullanılır:

```text
<type>(<scope>): <açıklama>
<type>: <açıklama>
```

### Örnekler:
- `feat(auth): add multi-factor authentication support`
- `fix(scanner): resolve timeout deadlock in dns thread pool`
- `refactor(makefile): extract markdown tree generation into external script`
- `docs(readme): add cli usage flags and quick start examples`
- `perf(query): cache metadata lookups to reduce response latency`
- `chore(deps): update vite and react dependencies to latest patch`
- `test(pipeline): add mock verification tests for failure recovery`

---

## 3. Kabul Edilen `type` Değerleri

| Type | Kategori | Anlamı ve Kullanım Alanı |
| :--- | :--- | :--- |
| `feat` | Yeni Yetenek | Kullanıcıya veya sisteme yeni bir özellik/modül eklenmesi (SemVer: MINOR) |
| `fix` | Hata Giderme | Bir bug, kilitlenme, deadlock veya beklenmeyen davranışın çözülmesi (SemVer: PATCH) |
| `refactor` | Yeniden Yapılandırma | Davranışı değiştirmeden kodun mimarisini, okunabilirliğini veya yapısını iyileştirme |
| `perf` | Performans | Çalışma hızını artıran veya bellek/kaynak tüketimini azaltan optimizasyonlar |
| `docs` | Dokümantasyon | README, inline docstring, kılavuzlar veya `.md` dosyalarındaki güncellemeler |
| `test` | Test & Doğrulama | Yeni birim/entegrasyon testi eklenmesi veya mevcut testlerin düzeltilmesi |
| `chore` | Bakım & Altyapı | `.gitignore`, bağımlılık yönetimi, lisans veya build araçları bakımı |
| `build` | Derleme & Paket | Derleme sistemi (npm, pnpm, cargo, makefile) veya harici bağımlılık revizyonları |

---

## 4. Mesaj Yazım Kuralları (Google & Angular Kılavuzları)

1. **Emir Kipi (Imperative Mood):** Başlıkta geçmiş zaman (*"added"*, *"fixed"*) değil, doğrudan emir kipi (*"add"*, *"fix"*, *"update"*) kullanılır.
2. **Küçük Harf (Lowercase):** `<type>` ve `<scope>` daima küçük harfle başlar.
3. **Noktasız Bitiş:** Başlık satırının sonuna nokta (`.`) konulmaz.
4. **Karakter Sınırı:** Başlık satırı 72 karakteri geçmemelidir (terminalde `git log --oneline` okunabilirliği için).
5. **Net ve Somut Açıklama:** *"update stuff"*, *"wip"*, *"fixes"*, *"commit"* gibi tembel ve belirsiz mesajlar **kesinlikle yasaktır**. Mesaj, neyin ve neden yapıldığını tek bakışta anlatmalıdır.

---

## 5. Atomik Değişiklik Kuralı (Atomic Commits)

- **Monolitik Commit Yasağı:** 10 farklı alakasız dosyayı (örneğin hem UI'ı, hem veritabanını, hem de build scriptini) tek bir commit içine yığmak yasaktır.
- **Mantıksal Ayrım:** Her commit tek bir mantıksal görevi temsil etmelidir.
  - *Doğru Sıralama:*
    1. `chore(deps): bump pnpm to latest`
    2. `feat(config): expose retry interval knobs`
    3. `feat(ui): add active status badge component`
    4. `docs(readme): document new retry environment variables`

---

## 6. Pre-Commit / Pre-Push Güvenlik ve Hijyen Filtresi

Depoya commit atılmadan veya push yapılmadan önce aşağıdaki kontroller istisnasız tamamlanmalıdır:

1. **Secret & Key Taraması:**
   - `.env`, `.env.local`, API anahtarları, Cloudflare / AWS / GCP token'ları, Telegram / Discord bot token'ları ve özel SSH anahtarları ASLA depoya eklenemez.
2. **Kişisel Veri (PII) Hijyeni:**
   - Telefon numaraları, ham kullanıcı JID'leri, ev/ofis yerel ağlarına ait IP/SSID bilgileri ve kişisel şifreler depodan temizlenmelidir.
3. **Çöp Dosya Temizliği:**
   - `__pycache__`, `.pytest_cache`, `.DS_Store`, derleme çıktıları (`dist/`, `build/`), IDE kalıntıları ve geçici swap dosyaları (`.swp`) `.gitignore` ile dışlanmalıdır.
4. **Doğrulama Şartı:**
   - Kod derlenmeden (`build`), test edilmeden veya syntax kontrolünden (`lint`/`typecheck`) geçirilmeden commit atılamaz.

---

## 7. Kırıcı Değişiklikler (Breaking Changes)

Geriye dönük uyumluluğu bozan bir mimari değişiklik yapıldığında:
- Başlıkta type/scope sonrasına ünlem işareti (`!`) eklenir:
  - `feat(api)!: change response structure to wrapped data object`
- Veya commit mesajının gövdesinde `BREAKING CHANGE:` başlığı açılarak göç (migration) talimatı verilir.
