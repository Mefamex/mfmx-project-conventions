# CHANGELOG — mfmx-project-conventions

> **Kayıt Kuralları:**  
> 1. **Okuyucu İçin Yazılır:** Bu dosya, projeyi kullanan kişinin "ne değişti, beni ne etkiler?" sorusunu cevaplar. Git log dökümü değildir; commit mesajları birebir kopyalanmaz, ilgili commitler tek maddede birleştirilir.  
> 2. **Ters Kronolojik:** En yeni kayıt daima **en üste** eklenir.  
> 3. **Başlık Biçimi:** `## YYYY-MM-DD | kapsamlı başlık`. Sürümlü projede sürüm başlığa eklenir: `## YYYY-MM-DD | v1.2.0 | kapsamlı başlık`. Aynı güne ait farklı konular ayrı başlık alabilir.  
> 4. **Madde Biçimi:** `- **kısa alt başlık :** açıklama`. Tablo kullanılmaz. Alt madde gerekiyorsa bir seviye girintiyle yazılır.  
> 5. **Gözden Kaçmaması Gerekenler:** Kaldırılan / adı değişen şeyler ve güvenlik düzeltmeleri alt başlıkta açıkça `Kaldırıldı`, `Yeniden adlandırıldı`, `Güvenlik` diye belirtilir; kullanıcıyı kıran değişiklik `Kırıcı Değişiklik` olarak işaretlenir.  
> 6. **TODO.DONE.md'den Farkı:** [`docs/TODO.DONE.md`](./docs/TODO.DONE.md) mühendislik kaydıdır (iş + kök neden + doğrulama kanıtı). CHANGELOG yalnızca dışarıya yansıyan sonucu özetler; kanıt ve detay için TODO.DONE.md'ye bakılır.  
> 7. **Yayınlanmamış Değişiklikler (isteğe bağlı):** Sürümlü projelerde en üstte `## Yayınlanmamış` başlığı tutulur; sürüm çıkınca tarih ve sürüm numarasıyla yeniden adlandırılır.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## Yayınlanmamış

- **Otomatik test (CI) :** Repoya `scripts/check.sh` bütünlük testi ve onu her PR'da ve `main`'e her push'ta çalıştıran GitHub Actions iş akışı (`.github/workflows/check.yml`) eklendi. Test; kırık linkleri, `make install` davranışını, pre-commit / pre-push hook'larını, şablon notunu, geçmişte gizli dosya olup olmadığını ve etiketlerin annotated olduğunu denetler. Bu araçlar reponun kendisi içindir, şablon olarak kopyalanmaz.

## 2026-11-22 | v2.1.0 | Gizli notlar, PR akışı ve düzeltmeler

- **docs/NOTES.local.md :** Repoya girmemesi gereken notlar için yeni dosya: yerel yollar, iç adresler, kişi / müşteri adları, gizli bağlam ve bir secret'ın nerede durduğu. Secret'ın kendisi buraya da yazılmaz. Repoda şablonu `docs/NOTES.local.example.md` izlenir; `make install` gerçek dosyayı yoksa oluşturur.
- **Güvenlik — üç katmanlı koruma :** `.gitignore` `*.local` / `*.local.*` dosyalarını dışlar (`*.example.*` şablonları hariç); pre-commit hook `git add -f` ile zorlansa bile bu dosyaları commit'ten durdurur; pre-push kontrol listesi geçmişte sızıntı olup olmadığına bakar.
- **Ajan kuralları :** Dosya arama araçlarında görünmediği için README yönlendirmesine ve `docs/TODO.md` kurallarına tam yoluyla eklendi. İçeriği izlenen dosyalara, commit / PR metnine ve CHANGELOG'a taşınmaz; `git clean -x/-X` onaysız çalıştırılmaz; worktree'lerde dosyanın bulunmadığı belirtildi.
- **Düzeltmeler :** `make install` artık şablon dosyası (`config.example.yaml`, `docs/NOTES.local.example.md`) olmayan projelerde çökmüyor, yalnızca var olanı kopyalıyor; README'deki AI kurulum promptu gizli not şablonunu da listeliyor; README mimari şeması yeni yerleşime göre yeniden çizildi.
- **Dal ve PR akışı :** `docs/standards/GIT_STANDARDS.md`'ye 9. bölüm eklendi: `<type>/<kısa-açıklama>` dal adları, bir dal = bir konu, Ne değişti / Neden / Doğrulama bölümlü PR açıklaması, varsayılan merge commit (atomik commitler ve co-author bilgisi korunur) ve birleşince dalın silinmesi.
- **make install — .env :** `.env` de artık `config.yaml` ve `docs/NOTES.local.md` gibi, yoksa şablonundan (`.env.example`) oluşturuluyor.

## 2026-11-12 | v2.0.0 | Tüm çalışma belgeleri docs/ altında, config şablonu ve Hızlı Giriş

- **Kırıcı Değişiklik — yeni yerleşim :** `TODO.md`, `ASK.md` ve `NOTES.md` kökten `docs/` altına; `standards/` klasörü `docs/standards/` altına taşındı. Kökte yalnızca README, CHANGELOG, LICENSE, Makefile ve yapılandırma şablonları kaldı. Eski yollara verilen linkler çalışmaz.
- **Kırıcı Değişiklik — config.yaml → config.example.yaml :** Repoda artık yalnızca şablon izlenir. Gerçek `config.yaml` `.gitignore`'dadır; `make install` dosya yoksa şablondan oluşturur.
- **README yönlendirmesi :** README'nin başına, çalışma belgelerinin `docs/` altında olduğunu ve okuma sırasını (`docs/TODO.md` → `docs/ASK.md` → `docs/NOTES.md`) veren zorunlu bir blok eklendi; README standardına da kural olarak girdi.
- **docs/TODO.md — Geliştirici Hızlı Girişi :** Aktif Sprint'ten önce 1. bölüm olarak eklendi. Aniden gelen veya nereye yazılacağı belli olmayan fikirler Aciliyet ve Önem alanlarıyla buraya yazılır; ajan oturum başında bunları değerlendirip doğru bölüme ya da dosyaya taşır. Bölüm normalde boş durur.

## 2026-11-11 | v1.0.0 | Yeni yerleşim, kalıcı karar kaydı ve STRUCTURE.md

- **Yeni yerleşim :** Kural belgeleri `standards/` klasörüne (`GIT_STANDARDS.md`, `PRE_COMMIT_CHECKLIST.md`, `PRE_PUSH_CHECKLIST.md`, `README.STANDARDS.md`), proje hakkındaki kayıtlar `docs/` klasörüne (`STRUCTURE.md`, `TODO.DONE.md`, `ASKED/`) taşındı. Kökte yalnızca günlük çalışma dosyaları kaldı.
- **Yeniden adlandırıldı :** `pre_commit_checklist.md`, `pre_push_checklist.md`, `README.standarts.md` ve kökteki `TODO.DONE.md` yeni yerlerine taşındı; eski yollara verilen linkler çalışmaz.
- **docs/ASKED/ :** Cevaplanan her soru konu bazlı dosyaya işlenir; en üstte yürürlükteki karar, altında silinmeyen tarihli geçmiş durur. `ASK.md`'ye 6 adımlı cevap işleme akışı ve sonda "Karara Bağlananlar" kapısı eklendi.
- **docs/STRUCTURE.md :** Her projede zorunlu klasör ve dosya haritası. README artık yalnızca ana dizini anlatır ve bu dosyaya atıf yapar.
- **Güvenlik — pre-commit hook :** Türkçe locale'de secret taraması "API" gibi büyük harfli anahtarları kaçırıyordu; düzeltildi. Hook artık yalnızca eklenen satırları tarar.
- **Commit tipleri :** `add` ve `update` resmi commit tipi oldu.
- **Sürümleme :** `vMAJOR.MINOR.PATCH` etiketleri ve GitHub release kuralı eklendi (`standards/GIT_STANDARDS.md`, bölüm 8); release notu CHANGELOG kaydından alınır.
- **config.yaml :** ENV adı kuralı `<ÖNEK>_<BÖLÜM>_<ANAHTAR>` olarak sabitlendi.
- **Yeni dosyalar :** `LICENSE` (MIT), `.gitignore`, `.env.example`, `CHANGELOG.md`.
- **Şablon kaynağı notu :** Şablon dosyalarına repo linkini veren görünmez bir not eklendi (md dosyalarında giriş bloğundan sonra HTML yorumu, diğerlerinde başlık kutusunun sonunda; dosyanın en başında değil). README meta tablosuna isteğe bağlı **Template** satırı eklendi.

## 2026-11-09 | Commit ve push kontrol listeleri

- **Pre-commit kontrol listesi :** Sıfır sızıntı, staging hijyeni, AI ajanı tuzakları, hızlı lint ve örnek hook.
- **Pre-push kontrol listesi :** Kullanıcı onayı, dal senkronu, tam test/build, geçmiş hijyeni, force push emniyeti, repo standartlarına uyum ve örnek hook.

## 2026-11-08 | NOTES, config, Makefile ve README standardı

- **NOTES.md :** Mimari kararlar, elenen yollar, ölçülmüş sınırlar ve platform tuzakları için teknik bellek şablonu.
- **config.yaml :** ENV > config.yaml > varsayılan kaskad modeli, birimli isimlendirme, secret yasağı.
- **Makefile :** Self-documenting yardım menüsü ve 6 zorunlu hedef (`install`, `reinstall`, `update`, `run`, `clean`, `remove`).
- **README standardı :** Meta tablosu, başlık hiyerarşisi ve içerik kuralları; AI ajanıyla kurulum promptu eklendi.

## 2026-11-07 | İlk sürüm

- **Çekirdek şablonlar :** `TODO.md` (Bağlam Çapası), `TODO.DONE.md` (kanıtlı arşiv), `ASK.md` (karar kuyruğu ve "Kendi Kararım").
- **Git standartları :** Conventional Commits, atomik commit, push izne tabi.
