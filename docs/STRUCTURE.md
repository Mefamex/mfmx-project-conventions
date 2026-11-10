# STRUCTURE — mfmx-project-conventions

> **Amaç:** "Aradığım şey nerede?" ve "Baktığım şey ne işe yarıyor?" sorularını cevaplar. Projeyi kodlamaya veya devam ettirmeye başlayan kişi (insan ya da AI ajanı) önce buraya bakar.  
> **Zorunluluk:** Her projede bulunur; README yalnızca ana dizini anlatır ve buraya atıf yapar.

> **Yazım Kuralları:**  
> 1. **Her Klasör Yazılır:** Üretilen veya `.gitignore`'daki klasörler de (`.git/`, `.venv/`, `node_modules/`, `dist/`) yazılır ve açıklamasında `(repoda yok)` / `(üretilir)` belirtilir; bunların **yalnızca adı** yazılır, içeriği asla listelenmez.  
> 2. **Dosyalar Göreli Seçilir:** Klasördeki dosya sayısı azsa hepsi yazılır; çoksa yalnızca önemli olanlar yazılır ve listenin sonuna `- ...` konur.  
> 3. **Tek Satır Açıklama:** Her satırın açıklaması `#` ile başlar ve tek satırdır. "Nasıl çalışır" buraya değil [`NOTES.md`](../NOTES.md)'ye yazılır.  
> 4. **Link Yok:** Ağaçlarda link verilmez; yollar okunarak ve aranarak bulunur. (Linkler taşınmalarda kırılır; yol adı kırılmaz.)  
> 5. **Biçim:** Kutu çizim karakterleri (`├──`) yerine girintili liste (`- klasor/`) kullanılır; girinti 4 boşluktur. Ana dizin için ayrıca `- ./` satırı yazılmaz; kökteki dosya ve klasörler en sol seviyede, aynı girintide durur.  
> 6. **Güncelleme Tetikleyicisi:** Klasör eklenince, silinince veya adı değişince bu dosya **aynı commit'te** güncellenir.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Klasör Yapısı

```text
- .git/                  # (repoda yok, git tarafından üretilir) Sürüm geçmişi
- standards/             # NASIL ÇALIŞILIR: kural belgeleri ve kontrol listeleri
- docs/                  # PROJE HAKKINDA: yapı haritası, yapılanlar ve kararlar
    - ASKED/             # Cevaplanmış soruların konu bazlı kalıcı karar kayıtları
```

---

## 2. Dosya Yapısı

```text
- README.md                        # Vitrin: ne olduğu, nasıl kurulur, nasıl kullanılır
- CHANGELOG.md                     # Okuyucuya yönelik değişiklik özeti (en yeni üstte)
- TODO.md                          # Giriş kapısı: Bağlam Çapası + aktif sprint + backlog
- ASK.md                           # Açık sorular, onay bekleyen kararlar, sonda karar kapısı
- NOTES.md                         # Teknik bellek: neden, elenen yollar, ölçülmüş sınırlar
- config.yaml                      # Yapılandırma: ENV > config.yaml > varsayılan
- Makefile                         # install, run, verify, clean... (make = yardım menüsü)
- .env.example                     # Ortam değişkeni şablonu; gerçek .env repoya girmez
- ...                              # LICENSE, .gitignore
- standards/
    - GIT_STANDARDS.md             # Commit formatı ve tipleri, push izne tabi
    - PRE_COMMIT_CHECKLIST.md      # Commit öncesi kontrol listesi + örnek hook
    - PRE_PUSH_CHECKLIST.md        # Push öncesi kontrol listesi + örnek hook
    - README.STANDARDS.md          # README nasıl yazılır: meta tablosu, başlık sırası
- docs/
    - STRUCTURE.md                 # Bu dosya: klasör ve dosya haritası
    - TODO.DONE.md                 # Yapılanların kanıtlı haritası (en yeni üstte, tek dosya)
    - ASKED/
        - _SABLON.md               # Konu dosyası şablonu + doldurulmuş örnek
        - <konu-adi>.md            # Her mikro konu: üstte geçerli karar, altta geçmiş
```
