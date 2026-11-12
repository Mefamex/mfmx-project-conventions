# ASK — Açık Sorular ve Karar Kuyruğu

> **Temel İlke:** "Ölçülmemiş bir tahminle koda girmek yok."  
> Bu dosya; mimari kararlar, yetki sınırları veya belirsizlik içeren konularda geliştiricinin yanıtını bekleyen açık soruları toplar.  
> Cevaplanan sorular konu bazlı karar dosyalarına (`docs/ASKED/<konu>.md`) işlenir ve en alttaki **Karara Bağlananlar** listesine tek satırla eklenir; aksiyon maddeleri [`TODO.md`](./TODO.md) listesine aktarılır.

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## Ajan İçin Soru ve Karar Kuralları

1. **Varsayımla Kodlama Yasaktır:** İki farklı yol varsa ve tercih kritikse tahminle ilerleme; soruyu buraya net seçeneklerle yaz.
2. **Kendi Kararım (İnisiyatif İlkesi):** Geliştirici otonomi vermişse ("kararı sen ver ve devam et"), kararı uygula ancak bu dosyaya Kendi Kararım başlığı altında **seçimini ve gerekçeni** tablo halinde kaydet. Kayıt, geliştirici onaylayana veya reddedene kadar burada kalır.
3. **Önce Kapıya Bak:** Bir konuda koda girmeden önce en alttaki **Karara Bağlananlar** listesinde o konuyu ara. Konu oradaysa ilgili dosyadaki "Yürürlükteki Karar"a uy.
4. **Karar Sessizce Çiğnenmez:** Yürürlükteki karara aykırı bir iş gerekiyorsa koda girme; buraya yeni soru aç. Cevap gelince aynı konu dosyasına yeni kayıt eklenir.

---

## Cevap İşleme Akışı (Sabit 6 Adım)

Bir soru cevaplandığında (bu dosyadaki "Geliştirici Yanıtı" satırında veya sohbette) adımlar **sırayla** uygulanır:

1. **Cevabı Kaydet:** Cevap sohbette verildiyse önce bu dosyada ilgili sorunun altına tarihle ve tırnak içinde aynen yaz. Yazmadan koda girme.
2. **Dosyayı Seç:** Karara Bağlananlar listesinde bu konu varsa o dosyayı kullan; yoksa [`docs/ASKED/_SABLON.md`](./ASKED/_SABLON.md) dosyasını kopyalayarak yeni konu dosyası aç.
   - Dosya adı en fazla 4 kelime, ASCII ve kebab-case olur (`token-suresi.md`, `log-formati.md`). Türkçe karakter kullanılmaz (ç→c, ğ→g, ı→i, ö→o, ş→s, ü→u).
   - Adda "ve" geçiyorsa (`auth-ve-log`) konu ikiye bölünür: bir dosya = tek bir karar alanı.
3. **Kaydı Ekle:** Konu dosyasının Geçmiş bölümünün **en üstüne** yeni kayıt ekle. Dosyanın başındaki "Yürürlükteki Karar" bloğunu güncelle. Önceki geçerli kaydın Durum alanını `Geçersiz — YYYY-MM-DD kararıyla değişti` yap. **Hiçbir kaydı silme.**
4. **Kapıyı Güncelle:** Bu dosyanın sonundaki Karara Bağlananlar listesine konu satırını ekle veya mevcut satırı yeni kararla güncelle.
5. **Aksiyonu Taşı:** Karar bir iş doğuruyorsa [`TODO.md`](./TODO.md) listesine ekle.
6. **Soruyu Sil:** Cevaplanan soruyu (veya onaylanan / reddedilen Kendi Kararım kaydını) bu dosyadan kaldır.

**Kendi Kararım kayıtları** da aynı akıştan geçer:
- **Onaylanırsa:** Karar veren alanı `Ajan (geliştirici onayladı)` olur.
- **Reddedilirse:** Ret de kaydedilir (`Ajan (geliştirici reddetti)`), böylece aynı fikir tekrar önerilmez; geri alma işi `TODO.md`'ye eklenir.

---

## 1. Acil Karar Bekleyenler (Bloklayıcılar / Blocking)
*Geliştiriciden yanıt gelmeden koda dokunulmaması gereken açık sorular:*

### Soru 1: [Konu / Modül Başlığı]
- **Durum / Sorun:** [Mevcut durum veya ortaya çıkan mimari ikilem]
- **Seçenek A:** [Seçenek 1 — Avantaj/Dezavantaj]
- **Seçenek B:** [Seçenek 2 — Avantaj/Dezavantaj]
- **Ajanın Önerisi:** [Ajanın teknik gerekçesiyle tavsiye ettiği yol]
- **Geliştirici Yanıtı:** *(Bekleniyor)*

---

## 2. Kendi Kararım (Ajanın Otonom Aldığı Kararlar — Onay Bekliyor)
*Geliştirici yokken ajanın inisiyatif alıp uyguladığı, gerekçelendirilmiş tercihler. Geliştirici onaylayana veya reddedene kadar burada kalır:*

### [YYYY-MM-DD HH:MM] — [Karar Konusu]

| Parametre / Alan | Seçilen Karar | Gerekçe / Neden Bu Yol Seçildi? |
| :--- | :--- | :--- |
| **[Karar verilen parametre / alan]** | `[Seçilen değer veya yol]` | [Neden bu yol: alternatife göre kazancı ve kabul edilen bedel] |
| **[Gerekirse ikinci alan]** | `[Seçilen değer]` | [Gerekçe] |

- **Geliştirici Onayı:** *(Bekleniyor — Onaylandı / Reddedildi)*

---

## 3. Ertelenmiş / Kullanımda Görülecekler (Deferred)
*Şu an koda engel olmayan, canlı kullanım tecrübesine veya ilerleyen fazlara bırakılan konular:*

- **[Ertelenen konu]:** [Neden şimdi karar verilmedi] — [Şu anki varsayılan davranış ve ne olunca tekrar bakılacağı]

---

## 4. Karara Bağlananlar (Kapı)
*Bir konuda koda girmeden önce bu listeye bak. Konu buradaysa dosyadaki "Yürürlükteki Karar"a uy. Her satır: konu, tek cümle güncel karar, dosya linki.*

- **[konu-adi] :** [Tek cümle yürürlükteki karar] → `docs/ASKED/[konu-adi].md`
