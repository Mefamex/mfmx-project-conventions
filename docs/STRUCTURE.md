# STRUCTURE — mfmx-project-conventions

> **Amaç:** "Aradığım şey nerede?" ve "Baktığım şey ne işe yarıyor?" sorularını cevaplar. Projeyi kodlamaya veya devam ettirmeye başlayan kişi (insan ya da AI ajanı) önce buraya bakar.  
> **Zorunluluk:** Her projede bulunur; README yalnızca ana dizini anlatır ve buraya atıf yapar.

> **Yazım Kuralları:**  
> 1. **Her Klasör Yazılır:** Üretilen veya `.gitignore`'daki klasörler de (`.git/`, `.venv/`, `node_modules/`, `dist/`) yazılır ve açıklamasında `(repoda yok)` / `(üretilir)` belirtilir; bunların **yalnızca adı** yazılır, içeriği asla listelenmez.  
> 2. **Dosyalar Göreli Seçilir:** Klasördeki dosya sayısı azsa hepsi yazılır; çoksa yalnızca önemli olanlar yazılır ve listenin sonuna `- ...` konur.  
> 3. **Tek Satır Açıklama:** Her satırın açıklaması `#` ile başlar ve tek satırdır. "Nasıl çalışır" buraya değil [`NOTES.md`](./NOTES.md)'ye yazılır.  
> 4. **Link Yok:** Ağaçlarda link verilmez; yollar okunarak ve aranarak bulunur. (Linkler taşınmalarda kırılır; yol adı kırılmaz.)  
> 5. **Biçim:** Kutu çizim karakterleri (`├──`) yerine girintili liste (`- klasor/`) kullanılır; girinti 4 boşluktur. Ana dizin için ayrıca `- ./` satırı yazılmaz; kökteki dosya ve klasörler en sol seviyede, aynı girintide durur.  
> 6. **Güncelleme Tetikleyicisi:** Klasör eklenince, silinince veya adı değişince bu dosya **aynı commit'te** güncellenir.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Klasör Yapısı

```text
- .git/                  # (repoda yok, git tarafından üretilir) Sürüm geçmişi
- .github/               # GitHub ayarları
    - workflows/         # GitHub Actions: her PR'da scripts/check.sh çalışır
- scripts/               # Bu reponun kendi araçları (şablon değildir, kopyalanmaz)
- docs/                  # Tüm çalışma belgeleri: görevler, sorular, kararlar, notlar, yapı haritası
    - ASKED/             # Cevaplanmış soruların konu bazlı kalıcı karar kayıtları
    - features/          # (İsteğe bağlı) Özellik başına bugünkü hâl belgeleri ve dizini
    - standards/         # NASIL ÇALIŞILIR: kural belgeleri ve kontrol listeleri
```

---

## 2. Dosya Yapısı

```text
- README.md                        # Vitrin (İngilizce): ne olduğu, nasıl kurulur, nasıl kullanılır
- README.tr.md                     # README'nin Türkçe sürümü; iki dosya birlikte güncellenir
- assets/
    - social-preview.png           # README görseli ve GitHub sosyal önizleme görseli (1280×640)
- CHANGELOG.md                     # Okuyucuya yönelik değişiklik özeti (en yeni üstte)
- config.example.yaml              # Yapılandırma şablonu; gerçek config.yaml bundan kopyalanır
- config.yaml                      # (repoda yok) Gerçek ayarlar; make install oluşturur
- .env.example                     # Ortam değişkeni şablonu; gerçek .env repoya girmez
- .env                             # (repoda yok) Gerçek ortam değişkenleri ve secret'lar; make install oluşturur
- Makefile                         # install, run, verify, clean... (make = yardım menüsü)
- ...                              # LICENSE, .gitignore
- .github/
    - workflows/
        - check.yml                # CI: PR ve main push'ta bütünlük testini çalıştırır
- scripts/
    - check.sh                     # Bütünlük testi: linkler, make install, hook'lar, özellik dizini, şablon notu, etiketler
- docs/
    - TODO.md                      # Giriş kapısı: Bağlam Çapası + Hızlı Giriş + aktif sprint
    - ASK.md                       # Açık sorular, onay bekleyen kararlar, sonda karar kapısı
    - NOTES.md                     # Teknik bellek: neden, elenen yollar, ölçülmüş sınırlar
    - NOTES.local.example.md       # Gizli notlar şablonu
    - NOTES.local.md               # (repoda yok) Gizli / yerel notlar; make install oluşturur
    - STRUCTURE.md                 # Bu dosya: klasör ve dosya haritası
    - TODO.DONE.md                 # Yapılanların kanıtlı haritası (en yeni üstte, tek dosya)
    - ASKED/
        - _SABLON.md               # Konu dosyası şablonu
        - <konu-adi>.md            # Her mikro konu: üstte geçerli karar, altta geçmiş
    - features/
        - README.md                # Kurallar ve özellik dizini (özellik, tek cümle, durum, gizli)
        - _SABLON.md               # Özellik dosyası şablonu
        - <ozellik-adi>.md         # Bir özelliğin bugünkü hâli: nasıl çalışır, ayarlar, tuzaklar, test
        - <ozellik-adi>.local.md   # (repoda yok) Yalnız gerekiyorsa: özelliğe özgü gizli maddeler
    - standards/
        - GIT_STANDARDS.md         # Commit formatı ve tipleri, sürümleme, push izne tabi
        - PRE_COMMIT_CHECKLIST.md  # Commit öncesi kontrol listesi + örnek hook
        - PRE_PUSH_CHECKLIST.md    # Push öncesi kontrol listesi + örnek hook
        - README.STANDARDS.md      # README nasıl yazılır: meta tablosu, başlık sırası
```
