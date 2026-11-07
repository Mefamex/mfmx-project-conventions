# README STANDARTLARI (DEFINITIVE SPECIFICATION)

> **Amaç:** Bu belge; yazılım projelerinde ve açık kaynak depolarda hazırlanan `README.md` dosyalarının değişmez yapısal standartlarını, başlık hiyerarşisini, meta bloğu biçimini ve içerik kurallarını tanımlar.  
> Bu standartları kullanan herhangi bir geliştirici ya da yapay zekâ ajanı, yeni bir proje oluştururken bu kılavuzu referans almalıdır.

---

## 1. Giriş ve Üst Bilgi Standardı (Header & Metadata Block)

Projelerde `README.md` dosyasının en tepesi projenin kimlik kartıyla başlar:

### 1.1. Proje Başlığı
- `# [proje-adi]` formatında, açık ve net ana başlık.

### 1.2. Standart Meta Tablosu
Projenin hemen başında, aşağıdaki standart Markdown tablosu yer alır:

```markdown
|              |                                                               |
| ------------ | ------------------------------------------------------------- |
| **Author**   | [Geliştirici / Kurum Adı](https://github.com/...)             |
| **Website**  | [https://example.com](https://example.com)                    |
| **License**  | MIT                                                           |
| **Created**  | YYYY-MM-DD                                                    |
| **Updated**  | YYYY-MM-DD                                                    |
| **Stack**    | [Çekirdek Diller ve Kütüphaneler / Örn: Python 3.12, Go 1.22] |
| **Platform** | [Hedef Ortam / Örn: Linux, Cloudflare Workers, Web]           |
| **Status**   | Production Ready / Active Development                         |
```

### 1.3. Vurucu Açıklama (The Hook / Slogan)
- Meta tablosunun hemen altında **1-3 cümlelik net bir özet** bulunur.
- Projenin ne işe yaradığı, hangi problemi çözdüğü ve temel çalışma mantığı lafı uzatmadan doğrudan aktarılır.

---

## 2. Zorunlu Başlıklar ve Sıralama Hiyerarşisi

Projelerde `README.md` içeriği şu standart başlık akışını izler:

```text
# [Proje Adı]
├── [Meta Tablosu]
├── [Vurucu Giriş / Slogan]
├── 1. Mimari ve Görsel Önizleme (Architecture & Preview)
├── 2. Belge Haritası (Repository Doc Map)
├── 3. Temel Yetenekler ve Özellikler (Key Features)
├── 4. Teknoloji Yığını ve Gereksinimler (Tech Stack & Prerequisites)
├── 5. Kurulum ve Hızlı Başlangıç (Installation & Quick Start)
├── 6. Yapılandırma (Configuration Guide)
├── 7. Kullanım ve Komutlar (Usage & CLI Reference)
├── 8. Güvenlik, Gizlilik ve Kırmızı Çizgiler (Safety & Privacy)
└── 9. Lisans ve Katkı (License)
```

---

## 3. Başlıkların İçerik Kuralları

### 3.1. Mimari ve Görsel Önizleme (Architecture & Preview)
Metin kalabalığı yerine sistemin zihinsel haritası çizilir:
- **ASCII / Metin Şeması:** CLI veya arka plan servislerinde veri akışı kutular ve oklarla gösterilir:
  ```text
  [ Kullanıcı / Girdi ] ──> [ Tetikleyici / Hook ] ──> [ Çekirdek Motor ] ──> [ Çıktı / Log ]
  ```
- **Arayüz Önizlemesi:** Web veya arayüz projelerinde ortalanmış bir ekran görüntüsü (`assets/preview.png`) yer alır.
- **Kritik Mimari Metrikleri:** Varsa bellek tüketimi, tepki süresi veya soğuk başlangıç gibi somut ölçüm değerleri belirtilir.

### 3.2. Belge Haritası (Repository Doc Map)
Projeye giren kişinin hangi dosyada neyi bulacağını gösteren rehber tablodur:

```markdown
| Belge | Amacı ve Sorumluluğu |
| :--- | :--- |
| `README.md` | Proje vitrini, genel mimari ve kullanım kılavuzu |
| `TODO.md` | Aktif sprint, yapılacak işler ve backlog |
| `TODO.DONE.md` | Doğrulanmış iş arşivi (ters kronolojik) |
| `ASK.md` | Karar bekleyen açık sorular ve Kendi Kararım kayıtları |
| `NOTES.md` | Dahili teknik bellek, elenen yöntemler ve sistem limitleri |
| `config.yaml` | Kaskad yapılandırma ayarları |
| `Makefile` | Tek komutla yaşam döngüsü yönetimi |
```

### 3.3. Temel Yetenekler ve Özellikler (Key Features)
- Maddeler halinde listelenir.
- Format kuralı: `* **Kalın Özellik Başlığı:** Özelliğin somut açıklaması ve getirdiği teknik avantaj.`
- Soyut vaatler yerine somut yetenekler yazılır.

### 3.4. Teknoloji Yığını ve Gereksinimler (Tech Stack & Prerequisites)
- Çatı (Framework), paket yöneticisi, dil sürümleri.
- Varsa özel donanım veya işletim sistemi gereksinimleri.

### 3.5. Kurulum ve Hızlı Başlangıç (Installation & Quick Start)
- Kod blokları içinde numaralı ve adım adım terminal komutları:
  1. Klonlama ve dizine girme
  2. Bağımlılık kurulumu (`make install` veya ilgili paket yöneticisi)
  3. Çalıştırma (`make run` veya `make dev`)

### 3.6. Yapılandırma (Configuration Guide)
- `config.yaml` dosyasının nasıl kullanılacağı.
- Öncelik kuralının hatırlatılması: `Ortam Değişkeni (ENV) > config.yaml > Varsayılan`.
- Hassas anahtarların asla buraya yazılmayacağı, ortam değişkeni üzerinden besleneceği uyarısı.

### 3.7. Kullanım ve Komutlar (Usage & CLI Reference)
- Varsa CLI bayrakları (`--dry-run`, `--status`, `--list`).
- `Makefile` üzerinden çalıştırılabilecek temel komutların listesi.

### 3.8. Güvenlik, Gizlilik ve Kırmızı Çizgiler (Safety & Privacy)
- Projenin kritik güvenlik kuralları (örn: yetkisiz işlem yapmama, gizli anahtar sızdırmama, yerel verileri dışarı aktarmama).

### 3.9. Lisans (License)
- Lisans türü (örn: MIT).
- Geliştirici veya organizasyon bilgisi.

---

## 4. Yazım ve Biçimlendirme İlkeleri

1. **Sıfır Dolgu:** Okuyucuyu boğan gereksiz giriş cümleleri yazılmaz; doğrudan çekirdeğe girilir.
2. **Görsel Hizalama:** Tablolar ve şemalar hizalı tutulur.
3. **Komut Bloklarında Açıklama:** Her komut bloğunun üstüne veya içine `# Açıklama` satırı eklenir.
4. **Simgesiz ve Sade Tasarım:** Dosyalarda emoji ve simge kalabalığı yapılmaz; temiz, profesyonel Markdown sözdizimi kullanılır.
