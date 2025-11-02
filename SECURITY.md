# Security Policy | Güvenlik Politikası

## 🔒 Supported Versions | Desteklenen Versiyonlar

Amata projesi şu anda aşağıdaki versiyonları desteklemektedir:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## 🛡️ Güvenlik Açığı Bildirimi | Reporting a Vulnerability

Amata projesi, kullanıcı güvenliğine önem verir. Bir güvenlik açığı keşfettiyseniz, lütfen bunu sorumlu bir şekilde bildirin.

### 📧 Güvenlik Açığı Bildirme Süreci | Vulnerability Disclosure Process

**ÖNEMLİ**: Güvenlik açıklarını doğrudan public GitHub Issues'da bildirmeyin. Bunun yerine aşağıdaki yöntemleri kullanın:

1. **Email ile Bildirim** (Preferred):
   - Email: [email protected]
   - Subject: `[SECURITY] Amata iOS App - Brief Description`
   - Güvenlik açığını detaylıca açıklayın

2. **GitHub Security Advisory**:
   - Repository'nin "Security" sekmesine gidin
   - "Report a vulnerability" butonuna tıklayın

### 📋 Güvenlik Açığı Raporunda Bulunması Gerekenler

Bir güvenlik açığı raporunda şunlar bulunmalıdır:

- **Açıklama**: Güvenlik açığının kısa açıklaması
- **Etki**: Bu açığın potansiyel etkisi
- **Yeniden Üretme Adımları**: Güvenlik açığını nasıl tekrar üretebileceğiniz
- **Önerilen Çözüm**: Varsa, önerilen çözüm yaklaşımı
- **Öncelik Seviyesi**: Kritik, Yüksek, Orta, Düşük

### ⏱️ Yanıt Süresi | Response Time

- **İlk Yanıt**: 48 saat içinde
- **Detaylı Değerlendirme**: 7 gün içinde
- **Düzeltme**: Güvenlik açığının ciddiyetine bağlı olarak:
  - **Kritik**: 7 gün içinde
  - **Yüksek**: 14 gün içinde
  - **Orta/Düşük**: Sonraki minor/major versiyon

### 🎁 Güvenlik Bulucu Teşekkürü | Security Researcher Recognition

Sorumlu bir şekilde güvenlik açığı bildiren araştırmacıları takdir ediyoruz. İstediğiniz takdirde, güvenlik danışmanında (advisory) sizin adınızı belirtebiliriz.

## 🔐 Güvenlik Özellikleri | Security Features

Amata uygulaması aşağıdaki güvenlik özelliklerini içerir:

### ✅ Mevcut Güvenlik Özellikleri

- **Yerel Veri Saklama**: Hassas veriler (şifre, kredi kartı) saklanmaz
- **Kamera Erişimi**: Yalnızca QR kod tarama için, kullanıcı izni gerekir
- **UserDefaults**: Favoriler ve sipariş geçmişi yerel olarak saklanır
- **Veri Şifreleme**: iOS sistem seviyesi şifreleme kullanılır
- **HTTPS**: Tüm ağ istekleri (gelecek özellikler için) HTTPS üzerinden yapılır

### 🚧 Planlanan Güvenlik Özellikleri

- [ ] App Transport Security (ATS) sertifikaları
- [ ] Keychain Services entegrasyonu (gerekirse)
- [ ] Biometric authentication (Face ID / Touch ID)
- [ ] End-to-end encryption (gelecek özellikler için)

## 📱 İzinler | Permissions

Amata uygulaması aşağıdaki izinleri kullanır:

### Kamera (Camera)
- **Kullanım**: QR kod tarama için
- **Açıklama**: "QR kod tarayarak masa numaranızı seçmek için kamera erişimine ihtiyacımız var."
- **Gizlilik**: Kamera verileri cihazda işlenir, sunucuya gönderilmez
- **Kullanıcı Kontrolü**: Kullanıcı kamera iznini vermek zorunda değildir (manuel masa seçimi mevcuttur)

### Fotoğraf Kütüphanesi (Photo Library)
- **Kullanım**: Profil fotoğrafı seçimi için
- **Açıklama**: "Profil fotoğrafınızı seçmek için fotoğraf kütüphanesi erişimine ihtiyacımız var."
- **Gizlilik**: Yalnızca seçilen fotoğraf uygulama içinde saklanır
- **Kullanıcı Kontrolü**: Kullanıcı bu özelliği kullanmak zorunda değildir

## 🔒 Veri Güvenliği | Data Security

### Saklanan Veriler
- **Favoriler**: Yerel olarak UserDefaults'ta saklanır
- **Sipariş Geçmişi**: Yerel olarak UserDefaults'ta saklanır
- **Kullanıcı Profili**: Yerel olarak UserDefaults'ta saklanır

### Saklanmayan Veriler
- ❌ Şifreler
- ❌ Kredi kartı bilgileri
- ❌ Kişisel tanımlayıcı bilgiler (PII) sunucuya gönderilmez

### Veri Şifreleme
- iOS sistem seviyesi şifreleme (Data Protection) kullanılır
- UserDefaults verileri otomatik olarak şifrelenir (iOS 7+)

## 🐛 Bilinen Güvenlik Sorunları | Known Security Issues

Şu anda bilinen güvenlik açığı yoktur. Herhangi bir güvenlik açığı keşfedilirse, bu bölüm güncellenecektir.

## 📚 Güvenlik Kaynakları | Security Resources

- [Apple iOS Security Guide](https://www.apple.com/business/docs/site/iOS_Security_Guide.pdf)
- [OWASP Mobile Security](https://owasp.org/www-project-mobile-security/)
- [Swift Security Best Practices](https://swift.org/security/)

## 🏆 Güvenlik Etiketi | Security Badge

Sorumlu güvenlik açığı bildirimi için teşekkürler! 🔒

---

**Amata Projesi Güvenlik Ekibi**  
*Last Updated: December 2024*

