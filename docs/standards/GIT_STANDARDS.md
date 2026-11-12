# Git & Commit Standartları

> **Amaç:** Depolarda çalışan geliştiriciler ve AI kodlama ajanları için bağlayıcı Git kurallarıdır. Depoya dokunmadan önce bu kuralların okunması ve uygulanması zorunludur.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Altın Kural: Commit Serbest, Push İzne Tabi (Gatekeeping)

```
[ Lokal Kodlama ] ──> [ Atomik Commit ] ──> [ Hijyen Kontrolü ] ──> [ KULLANICI ONAYI ] ──> [ git push ]
```

- **Lokal Commit Serbesttir:** Küçük ve atomik commitler rollback'i kolaylaştırır; lokalde serbestçe alınır.
- **Push Kesinlikle İzne Tabidir:** **Hiçbir AI ajanı açık kullanıcı onayı almadan `git push` çalıştıramaz.**
- **Force Push Yasaktır:** Açık kullanıcı talimatı olmadıkça `git push --force` veya `-f` yasaktır.

---

## 2. Commit Mesaj Formatı (Conventional Commits v1.0.0)

Standart sözdizimi:
```text
<type>(<scope>): <açıklama>
<type>: <açıklama>
```

### Örnekler:
- `feat(auth): add multi-factor authentication support`
- `add(templates): add env example file for local setup`
- `update(readme): update installation steps for uv`
- `fix(scanner): resolve timeout deadlock in dns thread pool`
- `refactor(makefile): extract markdown tree generation into external script`
- `docs(readme): add cli usage flags and quick start examples`
- `perf(query): cache metadata lookups to reduce response latency`
- `chore(deps): update vite and react dependencies to latest patch`
- `test(pipeline): add mock verification tests for failure recovery`

---

## 3. Kabul Edilen `type` Değerleri

| Type | Kategori | Kullanım Alanı | SemVer |
| :--- | :--- | :--- | :--- |
| `feat` | Yeni Özellik | Yeni bir yetenek veya modül eklenmesi | MINOR |
| `fix` | Hata Giderme | Bug, kilitlenme, deadlock veya beklenmeyen davranış çözümü | PATCH |
| `add` | Ekleme | Yeni dosya, şablon, belge, script veya varlık (asset) eklenmesi | MINOR |
| `update` | Güncelleme | Mevcut dosya, içerik veya ayarın davranışı bozmadan güncellenmesi | PATCH |
| `refactor` | Yeniden Yapılanma | Davranışı değiştirmeden mimari ve kod temizliği | - |
| `perf` | Performans | Çalışma hızını artıran veya kaynak tüketimini düşüren optimizasyon | - |
| `docs` | Dokümantasyon | README, inline docstring veya kılavuz güncellemeleri | - |
| `test` | Test | Birim/entegrasyon testi eklenmesi veya düzeltilmesi | - |
| `chore` | Bakım | `.gitignore`, bağımlılık güncellemeleri, araç ayarları | - |
| `build` | Derleme | Paket yöneticisi (pnpm, cargo, make) veya build sistemi revizyonları | - |

---

## 4. Yazım Kuralları (Google & Angular Standartları)

- **Emir Kipi (Imperative):** Geçmiş zaman (*"added"*, *"fixed"*) yerine doğrudan emir kipi (*"add"*, *"fix"*, *"update"*).
- **Küçük Harf (Lowercase):** `<type>` ve `<scope>` daima küçük harfle başlar.
- **Noktasız Bitiş:** Başlık satırının sonuna nokta (`.`) konmaz.
- **Uzunluk Sınırı:** Başlık 72 karakteri geçmemelidir (terminal okunabilirliği).
- **Netlik:** Tip ve açıklaması olmayan tek kelimelik mesajlar (*"wip"*, *"fixes"*, *"update"*, *"commit"*) **kesinlikle yasaktır**. `update(readme): ...` gibi tip olarak kullanımı serbesttir.
- **`feat` mi `add` mi?** Çalışan koda yeni bir yetenek kazandırılıyorsa `feat`; yeni bir dosya, belge veya şablon ekleniyorsa `add`.

---

## 5. Atomik Commit Kuralı (Atomic Commits)

- **Monolitik Commit Yasak:** Alakasız modülleri (UI + veritabanı + config) tek commit içine yığmak yasaktır.
- **Mantıksal Adım Sıralaması:**
  1. `chore(deps): bump pnpm to latest`
  2. `feat(config): expose retry interval knobs`
  3. `feat(ui): add active status badge component`
  4. `docs(readme): document new retry flags`

---

## 6. Pre-Commit / Pre-Push Hijyeni

Commit veya push öncesinde aşağıdaki detaylı kılavuz ve kontrol listelerinin uygulanması zorunludur:
- Detaylı commit öncesi adımları için: [`PRE_COMMIT_CHECKLIST.md`](./PRE_COMMIT_CHECKLIST.md)
- Detaylı push öncesi adımları için: [`PRE_PUSH_CHECKLIST.md`](./PRE_PUSH_CHECKLIST.md)

Commit veya push öncesi zorunlu 4 ana filtre:

1. **Secret & Key Taraması:** `.env`, API token, bot token veya SSH key depoya ASLA eklenemez.
2. **Kişisel Veri (PII) Hijyeni:** Telefon, raw kullanıcı ID'si, yerel IP/SSID ve şifreler depodan temizlenmelidir.
3. **Çöp Dosya Temizliği:** `__pycache__`, `.pytest_cache`, derleme çıktıları (`dist/`, `build/`), `.swp` ve işletim sistemi artıkları `.gitignore` ile engellenmelidir.
4. **Doğrulama Şartı:** Derleme (`build`), test veya syntax (`lint`) kontrolü geçmeden commit atılamaz.

---

## 7. Kırıcı Değişiklikler (Breaking Changes)

Geriye dönük uyumsuzluklarda:
- Başlıkta type/scope sonrasına `!` eklenir: `feat(api)!: change response structure to wrapped data object`
- Veya commit gövdesinde `BREAKING CHANGE: <açıklama>` başlığı açılarak göç (migration) talimatı verilir.

---

## 8. Sürümleme ve Release (Semantic Versioning)

- **Etiket Biçimi:** `vMAJOR.MINOR.PATCH` (örn. `v1.2.0`), annotated tag olarak atılır: `git tag -a v1.2.0 -m "v1.2.0"`.
- **Hangi Sayı Artar:** Kırıcı değişiklik (`!` / `BREAKING CHANGE`) → MAJOR; `feat` veya `add` → MINOR; yalnızca `fix` / `update` → PATCH.
- **CHANGELOG ile Bağ:** Sürüm çıkınca `CHANGELOG.md`'deki ilgili kaydın başlığına sürüm eklenir (`## YYYY-MM-DD | v1.2.0 | başlık`); GitHub release notu bu kaydın maddeleridir.
- **Ne Zaman Release:** Her commit release değildir. Kullanıcıyı etkileyen bir grup değişiklik tamamlanıp doğrulandığında çıkılır.
- **İzne Tabi:** Etiket ve release push ile aynı kurala tabidir; açık kullanıcı onayı olmadan yayınlanmaz.
