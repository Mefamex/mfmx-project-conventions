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
├── 2. Temel Yetenekler ve Özellikler (Key Features)
├── 3. Teknoloji Yığını ve Gereksinimler (Tech Stack & Prerequisites)
├── 4. Kurulum ve Hızlı Başlangıç (Installation & Quick Start)
├── 5. Yapılandırma (Configuration Guide)
├── 6. Kullanım ve Komutlar (Usage & CLI Reference)
├── 7. Güvenlik, Gizlilik ve Kırmızı Çizgiler (Safety & Privacy)
├── 8. Proje Yapısı — Ana Dizin (Project Layout)
└── 9. Lisans ve Katkı (License)
```

Sıralama mantığı: Herkesin okuması gerekenler (ne olduğu, kurulum, kullanım, güvenlik) üstte; yalnızca projeyi geliştirecek kişiyi ilgilendiren yapı bilgisi sonda.

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

### 3.2. Temel Yetenekler ve Özellikler (Key Features)
- Maddeler halinde listelenir.
- Format kuralı: `* **Kalın Özellik Başlığı:** Özelliğin somut açıklaması ve getirdiği teknik avantaj.`
- Soyut vaatler yerine somut yetenekler yazılır.

### 3.3. Teknoloji Yığını ve Gereksinimler (Tech Stack & Prerequisites)
- Çatı (Framework), paket yöneticisi, dil sürümleri.
- Varsa özel donanım veya işletim sistemi gereksinimleri.

### 3.4. Kurulum ve Hızlı Başlangıç (Installation & Quick Start)
- Kod blokları içinde numaralı ve adım adım terminal komutları:
  1. Klonlama ve dizine girme
  2. Bağımlılık kurulumu (`make install` veya ilgili paket yöneticisi)
  3. Çalıştırma (`make run` veya `make dev`)

### 3.5. Yapılandırma (Configuration Guide)
- `config.yaml` dosyasının nasıl kullanılacağı.
- Öncelik kuralının hatırlatılması: `Ortam Değişkeni (ENV) > config.yaml > Varsayılan`.
- Hassas anahtarların asla buraya yazılmayacağı, ortam değişkeni üzerinden besleneceği uyarısı.

### 3.6. Kullanım ve Komutlar (Usage & CLI Reference)
- Varsa CLI bayrakları (`--dry-run`, `--status`, `--list`).
- `Makefile` üzerinden çalıştırılabilecek temel komutların listesi.

### 3.7. Güvenlik, Gizlilik ve Kırmızı Çizgiler (Safety & Privacy)
- Projenin kritik güvenlik kuralları (örn: yetkisiz işlem yapmama, gizli anahtar sızdırmama, yerel verileri dışarı aktarmama).

### 3.8. Proje Yapısı — Ana Dizin (Project Layout)
Yalnızca **ana dizindeki** dosya ve klasörler tanımlanır; alt klasörlerin haritası `docs/STRUCTURE.md`'dedir (her projede zorunlu).
- Bölüm, `docs/STRUCTURE.md`'ye atıf veren tek cümleyle başlar.
- Her öğe **link verilerek** madde halinde yazılır: ``- [`dosya`](./dosya) — tek cümle görevi.``
- Klasör maddesi tek cümleyle klasörün işini anlatır; içindeki önemli belge veya yollar altına **girintili ve linkli alt maddeler** olarak yazılır (her biri tek cümle).
- Kod bloğu veya ağaç çizimi kullanılmaz; ağaç `docs/STRUCTURE.md`'nin işidir.

```markdown
## 8. Proje Yapısı (Ana Dizin)

Tüm klasörlerin ve önemli dosyaların haritası için: [`docs/STRUCTURE.md`](./docs/STRUCTURE.md).

- [`TODO.md`](./TODO.md) — [Dosyanın işi, tek cümle.]
- [`src/`](./src/) — [Klasörün işi, tek cümle.]
    - [`main.py`](./src/main.py) — [Bu dosyanın işi, tek cümle.]
- [`docs/`](./docs/) — Proje hakkında: projenin yapısı, yapılan işler ve verilen kararlar.
    - [`STRUCTURE.md`](./docs/STRUCTURE.md) — Tüm klasörlerin ve önemli dosyaların haritası.
    - [`TODO.DONE.md`](./docs/TODO.DONE.md) — Yapılan işlerin kanıtlı haritası.
    - [`ASKED/`](./docs/ASKED/) — Cevaplanmış soruların kalıcı karar kayıtları.
```

### 3.9. Lisans (License)
- Lisans türü (örn: MIT).
- Geliştirici veya organizasyon bilgisi.

---

## 4. Yazım ve Biçimlendirme İlkeleri

1. **Sıfır Dolgu:** Okuyucuyu boğan gereksiz giriş cümleleri yazılmaz; doğrudan çekirdeğe girilir.
2. **Görsel Hizalama:** Tablolar ve şemalar hizalı tutulur.
3. **Komut Bloklarında Açıklama:** Her komut bloğunun üstüne veya içine `# Açıklama` satırı eklenir.
4. **Simgesiz ve Sade Tasarım:** Dosyalarda emoji ve simge kalabalığı yapılmaz; temiz, profesyonel Markdown sözdizimi kullanılır.
