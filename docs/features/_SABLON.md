# [Özellik Adı]

> **Ne Yapar:** [Kullanıcının gözünden tek-iki cümle: bu özellik kime, ne sağlar]  
> **Durum:** [Aktif / Deneysel / Park]  
> **Gizli kısım:** [Yok / Var → `docs/features/<ozellik-adi>.local.md`, tam yoluyla okunur]  
> **Son doğrulama:** [YYYY-MM-DD, commit `abc1234` — bu dosyanın gerçek durumla en son karşılaştırıldığı gün ve o andaki commit]  
> **Doğrulama komutu:** [`...` — çalıştırılınca bu dosyanın hâlâ doğru olduğunu gösteren komut ve beklenen sonuç; ajan dosyaya güvenmeden önce bunu çalıştırır]

<!--
BU ŞABLON NASIL KULLANILIR:
1. Bu dosyayı docs/features/<ozellik-adi>.md adıyla kopyalayın.
   Ad: en fazla 3 kelime, ASCII, kebab-case (gorsel-hatti, zamanli-mesaj). Türkçe karakter yok.
2. docs/features/README.md dizinine bu özelliğin tek satırını ekleyin.
3. Bu dosya özelliğin BUGÜNKÜ hâlini anlatır. Tarihçe TODO.DONE.md'ye, kararlar docs/ASKED/'e,
   açık işler TODO.md'ye yazılır; buradan yalnızca link verilir.
4. Gizli madde gerekiyorsa docs/features/<ozellik-adi>.local.md dosyasını açın. O dosyada
   aşağıdaki bölüm başlıklarından yalnızca gizli madde içerenleri kullanın; secret'ın kendisi
   (şifre, token, anahtar) oraya da yazılmaz, yalnızca nerede durduğu yazılır.
5. Ajan bu dosyaya güvenmeden önce yukarıdaki "Doğrulama komutu"nu çalıştırır; sonuç
   beklenenle uyuşmuyorsa önce dosyayı gerçek duruma göre düzeltir, "Son doğrulama"yı günceller.
6. Dosyayı kısa tutun (yaklaşık 100 satır). Uzuyorsa ya özellik ikiye bölünür ya da ayrıntı
   ilgili ASKED / NOTES kaydına taşınıp buradan link verilir.
7. Boş kalan bölümü silmeyin; "Yok" yazın. Böylece okuyan bölümün unutulmadığını anlar.
Bu yorum bloğunu kopyaladığınız dosyada silebilirsiniz.
-->

<!-- Şablon: https://github.com/Mefamex/mfmx-project-conventions — güncel sürümü ve diğer şablonları orada bulabilirsiniz. -->

---

## 1. Değişmez Kurallar (YAPMA)
*Bu özellikte asla yapılmaması gerekenler ve nedenleri, tek satırlık maddeler halinde. Daha önce yanlışlıkla yapılıp geri alınmış her değişiklik buraya yazılır; böylece başka bir oturum aynı hatayı tekrarlamaz.*

---

## 2. Nasıl Çalışır
*Akış adım adım: tetikleyici ne, hangi bileşenlerden geçiyor, çıktı nereye gidiyor. Kodu okumadan resmi görmeye yetecek kadar; satır satır kod anlatımı değil.*

---

## 3. Ayarlar ve Ortam Değişkenleri
*Bu özelliği etkileyen `config.yaml` anahtarlarının ve ENV adlarının yalnızca adları ve bu özellikteki etkisi. Varsayılan değerler ve açıklamaların tek kaynağı `config.example.yaml` / `.env.example`'dır; burada tekrar yazılmaz, böylece iki yerde farklılaşmaz.*

---

## 4. Sınırlar ve Tuzaklar
*Yalnızca bu özelliğe ait bilinen sınırlar, ölçülmüş eşikler, "çalışıyor görünür ama çalışmaz" durumları ve platform gariplikleri. Birden çok özelliği ilgilendiren bilgi buraya değil `docs/NOTES.md`'ye yazılır.*

---

## 5. Nasıl Test Edilir
*Özelliğin çalıştığını kanıtlayan komutlar ve beklenen sonuçları; otomatik test yoksa elle doğrulama adımları.*

---

## 6. İlgili Dosyalar
*Özelliğin kodunun, testlerinin ve ayar dosyalarının yolları; her birinin bu özellikteki rolü tek satırla. Özellik depo dışındaki dosyalara da dokunuyorsa (`/etc/...`, `~/.config/...`, servis birimleri) onlar da ayrı bir "Depo dışı" alt listesinde yazılır: bu dosyalardan biri değişince bu belge de güncellenir. Repoya girmeyen artefaktlar (veri seti, model ağırlığı, büyük medya) da "Repoda yok" alt listesinde yazılır: nerede durduğu, kimde olduğu, boyutu / adedi ve ne kadar güncel olduğu.*

---

## 7. Bağlantılar
*İçerik kopyalanmaz, yalnızca yol verilir:*

- **Kararlar:** [Bu özelliği etkileyen `docs/ASKED/<konu>.md` dosyaları]
- **Açık işler:** [`docs/TODO.md`'deki ilgili maddelerin adları]
- **Tarihçe:** `docs/TODO.DONE.md`'de `**Özellik:** <ozellik-adi>` satırı aranarak bulunur
