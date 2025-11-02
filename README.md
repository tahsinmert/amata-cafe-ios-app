# Amata - Modern Cafe Order App | iOS QR Code Ordering System

<div align="center">
  <p>
    <a href="#turkish-version">🇹🇷 Türkçe</a> • 
    <a href="#english-version">🇬🇧 English</a>
  </p>
</div>

---

<a id="turkish-version"></a>
<meta name="description" content="Amata: iOS için modern cafe sipariş uygulaması. QR kod ile masa seçimi, menü yönetimi, favoriler, sipariş takibi. SwiftUI ve MVVM mimarisi ile geliştirilmiş premium cafe uygulaması.">
<meta name="keywords" content="cafe uygulaması, QR kod sipariş, iOS uygulama, SwiftUI, cafe sipariş sistemi, restoran uygulaması, mobil sipariş, amata">
<meta name="author" content="Tahsin Mert Mutlu">
<meta property="og:title" content="Amata - Modern Cafe Sipariş Uygulaması">
<meta property="og:description" content="iOS için modern ve şık cafe sipariş uygulaması. QR kod tarama, menü yönetimi, sipariş takibi ve daha fazlası.">
<meta property="og:image" content="amata-logo.png">
<meta property="og:type" content="website">

<div align="center">
  <img src="amata-logo.png" alt="Amata Cafe Sipariş Uygulaması Logo - Modern iOS Cafe Sipariş Sistemi" width="300" height="auto"/>
  
  <h2>Premium Cafe Sipariş Uygulaması | iOS QR Kod Sipariş Sistemi</h2>
  
  <p><strong>Masalarından doğrudan sipariş verme deneyimi</strong></p>
  
  [![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
  [![iOS](https://img.shields.io/badge/iOS-17.0+-blue.svg)](https://developer.apple.com/ios/)
  [![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-green.svg)](https://developer.apple.com/xcode/swiftui/)
  [![License](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20iPadOS-lightgrey.svg)](https://developer.apple.com/)
</div>

---

## 📱 Amata Nedir? | Cafe Sipariş Uygulaması Hakkında

**Amata**, restoran ve cafe işletmeleri için geliştirilmiş modern bir **mobil sipariş uygulaması**dır. Müşterilerin masalarından doğrudan sipariş verebilecekleri bu iOS uygulaması, **QR kod tarama**, **menü yönetimi**, **sipariş takibi** ve **favoriler sistemi** gibi gelişmiş özellikler sunar.

Amata, Apple'ın minimalizm felsefesi ile Paris kahvehanelerinin sıcak atmosferini birleştiren **"premium ama samimi"** bir kullanıcı deneyimi sunar. Uygulama, SwiftUI ve MVVM mimarisi kullanılarak geliştirilmiştir ve iOS 17+ cihazlarda çalışır.

## ✨ Amata Cafe Uygulaması Özellikleri

### 📋 Menü ve Sipariş Özellikleri
- **Menü Yönetimi**: Kategorilere ayrılmış (Kahve, Pastane, Soğuk İçecekler, Atıştırmalıklar, Tatlılar) zengin menü görüntüleme
- **Akıllı Arama**: Menü öğelerinde anlık arama ve filtreleme
- **Ürün Detay Sayfası**: Büyük görseller, açıklamalar ve miktar seçimi ile detaylı ürün görüntüleme
- **Sepet Yönetimi**: Kolay sipariş ekleme/çıkarma ve miktar kontrolü
- **Özel Notlar**: Siparişe özel talimatlar, alerji bilgileri ve özel istekler ekleme

### 📱 Teknoloji ve İnovasyon
- **QR Kod Tarama**: Gerçek zamanlı kamera ile masa numarası otomatik seçimi
- **Sipariş Takibi**: Gerçek zamanlı sipariş durumu takibi (Beklemede → Hazırlanıyor → Hazır)
- **Favoriler Sistemi**: Sık sipariş edilen ürünleri favorilere ekleme ve hızlı erişim
- **Sipariş Geçmişi**: Geçmiş siparişleri görüntüleme ve yeniden sipariş verme

### 🌍 Kullanıcı Deneyimi
- **Çoklu Dil Desteği**: Türkçe ve İngilizce tam lokalizasyon
- **Özel Tema**: Sıcak kahve tonlarında (#EDE0D4, #DDB892, #B08968, #7F5539) minimal ve şık tasarım
- **Animasyonlar**: Yumuşak spring animasyonları ile akıcı geçişler
- **Haptic Feedback**: Dokunsal geri bildirimler ile gelişmiş kullanıcı etkileşimi
- **Adaptif UI**: iPhone ve iPad için optimize edilmiş arayüz

---

## 🛠 Amata Teknoloji Stack'i | Kullanılan Teknolojiler

Amata uygulaması, modern iOS geliştirme standartlarına uygun olarak geliştirilmiştir:

### Core Technologies
- **SwiftUI 5.0**: Apple'ın modern ve bildirim tabanlı UI framework'ü
- **Swift 5.9+**: Güçlü ve güvenli programlama dili
- **MVVM Mimarisi**: Model-View-ViewModel pattern ile temiz kod organizasyonu
- **Combine Framework**: Reactive programlama ve asenkron veri akışı yönetimi

### Features & Integrations
- **AVFoundation**: QR kod tarama için gerçek zamanlı kamera entegrasyonu
- **UIKit**: SwiftUI ile UIKit entegrasyonu (QR Scanner için)
- **UserDefaults**: Yerel veri saklama (favoriler, sipariş geçmişi)
- **Haptic Feedback**: UINotificationFeedbackGenerator ile dokunsal geri bildirimler
- **Localization**: Çoklu dil desteği için `.lproj` dosyaları

### Design & Animation
- **SF Rounded Font**: Apple'ın sistem fontu ile tutarlı tipografi
- **Custom Color Palette**: Sıcak kahve tonlarında özel renk paleti
- **Spring Animations**: Yumuşak ve doğal animasyonlar
- **Matched Geometry Effects**: Akıcı geçiş animasyonları

---

## 📋 Sistem Gereksinimleri | Minimum Gereksinimler

### Geliştirme Ortamı
- **Xcode 15.0+**: Apple'ın resmi IDE'si
- **Swift 5.9+**: Modern Swift versiyonu
- **macOS 13.0+**: Xcode ile uyumlu macOS versiyonu
- **iOS Simulator**: Test için iOS simülatörü

### Çalışma Ortamı (Runtime)
- **iOS 17.0+**: Minimum iOS versiyonu
- **iPadOS 17.0+**: iPad desteği
- **Kamera Erişimi**: QR kod tarama özelliği için (opsiyonel)
- **Cihaz**: iPhone 8 ve üzeri, iPad (6. nesil) ve üzeri

### İzinler
- **NSCameraUsageDescription**: QR kod tarama için kamera erişimi gereklidir

---

## 🚀 Amata Uygulamasını Kurma | Installation Guide

### Hızlı Başlangıç (Quick Start)

1. **Projeyi İndirin veya Klonlayın**:
```bash
git clone https://github.com/yourusername/amata.git
cd amata
```
veya ZIP dosyası olarak indirip açın.

2. **Xcode'da Projeyi Açın**:
```bash
open tabli.xcodeproj
```
veya Finder'dan `tabli.xcodeproj` dosyasına çift tıklayın.

3. **Sertifika ve Profil Ayarları**:
   - Xcode'da "Signing & Capabilities" bölümüne gidin
   - Geliştirme takımınızı seçin
   - Xcode otomatik olarak provisioning profile oluşturacaktır

4. **Simülatör veya Cihaz Seçin**:
   - Üst menüden hedef cihazı seçin (iPhone 15 Pro, iPad Pro, vb.)

5. **Uygulamayı Çalıştırın**:
   - ⌘R tuşlarına basın veya Play butonuna tıklayın

### İlk Çalıştırma Notları
- **Kamera İzni**: İlk QR kod tarama denemesinde kamera izni isteyecektir
- **Test Verileri**: Uygulama örnek menü verileri ile birlikte gelir
- **Dil Seçimi**: Varsayılan dil sistem diline göre belirlenir

---

## 📖 Amata Kullanım Kılavuzu | Kullanıcı Rehberi

### 🎯 İlk Kullanım Adımları (First Time Setup)

#### 1. Masa Seçimi (Table Selection)
- Uygulama açıldığında masa numaranızı seçmeniz gerekir
- **Manuel Seçim**: "Masa Seç" butonuna tıklayarak masa numarasını manuel olarak seçebilirsiniz
- **QR Kod Tarama**: "QR Kod ile Masa Seç" butonuna tıklayarak kamera ile masa QR kodunu tarayabilirsiniz
  - Kamera izni verildikten sonra QR kod görüntüsü otomatik tespit edilir
  - Geçerli QR kod formatı: `table-5` veya sadece `5` (masa numarası)

#### 2. Menüye Erişim (Menu Access)
- Ana sayfadaki "Siparişe Başla" butonuna tıklayarak menüye erişin
- Menü kategorilere ayrılmıştır:
  - ☕ Kahve
  - 🥐 Pastane Ürünleri
  - 🧊 Soğuk İçecekler
  - 🥗 Atıştırmalıklar
  - 🍰 Tatlılar

#### 3. Ürün Seçimi ve Sipariş Verme
1. **Kategori Seçimi**: Üst kısımdaki kategori butonlarından birini seçin
2. **Ürün Görüntüleme**: Ürün kartına tıklayarak detay sayfasını açın veya "+" butonuna tıklayarak direkt sepete ekleyin
3. **Miktar Ayarlama**: Ürün detay sayfasında miktarı artırın/azaltın
4. **Sepete Ekleme**: "Sepete Ekle" butonuna tıklayın
5. **Sepet Kontrolü**: Sağ üst köşedeki sepet ikonuna tıklayarak sepeti görüntüleyin
6. **Özel Notlar**: Sepet sayfasında özel talimatlar, alerji bilgileri ekleyebilirsiniz
7. **Sipariş Onayı**: "Sipariş Ver" butonuna tıklayarak siparişinizi onaylayın

#### 4. Sipariş Takibi
- Ana sayfada "Sipariş Durumu" butonu görünür (aktif sipariş varsa)
- Sipariş durumları:
  - ⏳ **Beklemede**: Sipariş alındı, hazırlanmayı bekliyor
  - 👨‍🍳 **Hazırlanıyor**: Barista siparişinizi hazırlıyor
  - ✅ **Hazır**: Siparişiniz hazır, tezgahtan alabilirsiniz

### 🚀 Gelişmiş Özellikler (Advanced Features)

#### ⭐ Favoriler Sistemi
- **Favoriye Ekleme**: Ürün kartındaki yıldız ikonuna tıklayarak favorilere ekleyin
- **Favoriler Sayfası**: Ana sayfadan "Favoriler" butonuna tıklayarak favori ürünlerinize erişin
- **Hızlı Sipariş**: Favoriler sayfasından direkt sepete ekleyebilirsiniz

#### 📊 Sipariş Geçmişi
- **Geçmiş Görüntüleme**: Ana sayfadan "Geçmiş" butonuna tıklayarak geçmiş siparişlerinizi görüntüleyin
- **Sipariş Detayları**: Her sipariş için tarih, saat, ürünler ve toplam fiyat bilgisi

#### 📝 Sipariş Düzenleme
- **Bekleyen Siparişler**: Sipariş durumu "Beklemede" iken siparişi düzenleyebilirsiniz
- **Sipariş Detayları**: Sipariş durumu sayfasından "Düzenle" butonuna tıklayın

#### 🌍 Dil Değiştirme
- Ana sayfanın sağ üst köşesindeki dil butonuna tıklayın
- Türkçe veya İngilizce seçeneklerinden birini seçin
- Dil değişikliği uygulama genelinde geçerli olur

#### 🔍 Arama Özelliği
- Menü sayfasındaki arama çubuğuna ürün adı yazarak arama yapabilirsiniz
- Arama tüm kategorilerde çalışır

---

## 🏗 Amata Proje Yapısı | Kod Organizasyonu

Amata, **MVVM (Model-View-ViewModel)** mimarisi ile organize edilmiştir:

```
tabli/
├── Models/                          # Veri Modelleri
│   ├── MenuItem.swift               # MenuItem, OrderItem, Table, MenuCategory
│   └── SampleData.swift             # Örnek menü verileri ve test datası
│
├── ViewModels/                      # İş Mantığı Katmanı
│   └── OrderViewModel.swift        # Sipariş, sepet, favoriler, geçmiş yönetimi
│
├── Views/                           # UI Katmanı (SwiftUI)
│   ├── SplashView.swift            # Açılış ekranı ve animasyonlar
│   ├── HomeView.swift              # Ana sayfa (masa seçimi, menü erişimi)
│   ├── MenuView.swift              # Menü görüntüleme ve kategori filtreleme
│   ├── ProductDetailView.swift     # Ürün detay sayfası (görsel, açıklama, miktar)
│   ├── CartView.swift              # Sepet görüntüleme ve sipariş verme
│   ├── OrderConfirmationView.swift # Sipariş onay animasyonu
│   ├── OrderStatusView.swift      # Sipariş durumu takibi
│   ├── OrderDetailsView.swift     # Sipariş detay görüntüleme
│   ├── EditOrderView.swift        # Bekleyen sipariş düzenleme
│   ├── FavoritesView.swift        # Favori ürünler sayfası
│   ├── OrderHistoryView.swift     # Sipariş geçmişi
│   ├── QRCodeScannerView.swift    # QR kod tarama UI (SwiftUI)
│   ├── QRCodeScannerViewController.swift # QR kod tarama (UIKit)
│   ├── QRCodeScannerRepresentable.swift # SwiftUI-UIKit bridge
│   ├── LanguagePickerView.swift   # Dil seçimi
│   └── SettingsView.swift         # Ayarlar sayfası
│
├── Theme/                           # Tasarım Sistemi
│   └── AppTheme.swift              # Renk paleti, font, animasyon ayarları
│
├── Localization/                    # Çoklu Dil Desteği
│   ├── LocalizationManager.swift   # Dil yönetimi ve değiştirme
│   ├── en.lproj/
│   │   └── Localizable.strings     # İngilizce çeviriler
│   └── tr.lproj/
│       └── Localizable.strings     # Türkçe çeviriler
│
├── Assets.xcassets/                 # Görseller ve İkonlar
│   ├── AppIcon.appiconset/         # Uygulama ikonu
│   ├── AmataLogo.imageset/         # Amata logosu
│   └── AccentColor.colorset/       # Vurgu rengi
│
├── ContentView.swift                # Ana görünüm router
└── tabliApp.swift                   # Uygulama giriş noktası
```

### 📦 Bağımlılıklar
Amata, **harici bağımlılık kullanmaz**. Tüm özellikler native iOS framework'leri ile geliştirilmiştir:
- SwiftUI (UI)
- AVFoundation (Kamera)
- Combine (Reactive Programming)
- UserDefaults (Local Storage)

---

## 🎨 Amata Tasarım Sistemi | UI/UX Design

Amata, **sıcak kahve tonlarında minimalist** bir tasarım dilini benimser. Tasarım, Apple'ın Human Interface Guidelines ile uyumludur.

### 🎨 Renk Paleti (Color Palette)
| Renk | Hex Kodu | Kullanım Alanı |
|------|----------|----------------|
| Beige Light | `#EDE0D4` | Arka plan, kartlar |
| Beige Medium | `#DDB892` | İkincil arka planlar |
| Brown Medium | `#B08968` | İkincil metin, çizgiler |
| Brown Dark | `#7F5539` | Ana metin, vurgular |
| Ivory | `#F5F1EB` | Kart arka planları |
| Cream | `#F9F6F2` | Ana arka plan |

### ✍️ Tipografi (Typography)
- **Font Ailesi**: SF Rounded (SF Rounded Pro)
- **Başlıklar**: Bold, 24-32pt
- **Alt Başlıklar**: Semibold, 18-20pt
- **Gövde Metni**: Regular, 14-16pt
- **Küçük Metin**: Regular, 12-14pt

### ✨ Animasyonlar (Animations)
- **Spring Animations**: `Animation.spring(response: 0.4, dampingFraction: 0.7)`
- **Süre**: 0.3-0.6 saniye arası
- **Geçişler**: Fade, scale, slide kombinasyonları
- **Haptic Feedback**: Light, Medium, Heavy seviyelerinde

### 📐 Layout Kuralları
- **Köşe Yuvarlamaları**: 16pt-28pt (kartlar, butonlar)
- **Padding**: 16pt-24pt (standart boşluklar)
- **Gölgeler**: Opacity 0.08-0.15, radius 10-20pt
- **Grid System**: 12-column responsive grid (iPad için)

### 🎯 UX Prensipleri
- **Minimalizm**: Gereksiz UI elementlerinden kaçınma
- **Tutarlılık**: Tüm ekranlarda tutarlı tasarım dili
- **Erişilebilirlik**: Dynamic Type desteği, yüksek kontrast
- **Geri Bildirim**: Haptic feedback ve görsel geri bildirimler

---

## 🌍 Lokalizasyon ve Dil Desteği | Localization

Amata uygulaması, **çoklu dil desteği** ile geliştirilmiştir:

### Desteklenen Diller
- 🇹🇷 **Türkçe** (Turkish): Varsayılan dil
- 🇬🇧 **İngilizce** (English): İkinci dil desteği

### Lokalizasyon Yapısı
```
Localization/
├── LocalizationManager.swift      # Dil yönetim sistemi
├── en.lproj/
│   └── Localizable.strings       # İngilizce metinler (90+ string)
└── tr.lproj/
    └── Localizable.strings       # Türkçe metinler (90+ string)
```

### Yeni Dil Ekleme
Yeni dil eklemek için:
1. `Localization/` klasörüne yeni `.lproj` klasörü oluşturun (örn: `de.lproj`)
2. `Localizable.strings` dosyasını ekleyin
3. Tüm string anahtarlarını çevirin
4. `LocalizationManager.swift` dosyasına yeni dil enum değeri ekleyin

### Lokalize Edilen Bölümler
- ✅ Tüm UI metinleri
- ✅ Hata mesajları
- ✅ Bildirimler
- ✅ Tarih/saat formatları
- ✅ Fiyat formatları (₺ vs $)

---

## 🔒 İzinler

Uygulama aşağıdaki izinleri kullanır:

- **Kamera**: QR kod tarama için (opsiyonel)

İzin açıklaması: *"QR kod tarayarak masa numaranızı seçmek için kamera erişimine ihtiyacımız var."*

---

## 🔐 Güvenlik ve İzinler | Privacy & Permissions

### Kullanılan İzinler
- **NSCameraUsageDescription**: QR kod tarama için kamera erişimi
  - **Açıklama**: "QR kod tarayarak masa numaranızı seçmek için kamera erişimine ihtiyacımız var."
  - **Kullanım**: Yalnızca QR kod tarama işlemi sırasında
  - **Gizlilik**: Kamera verileri cihazda işlenir, sunucuya gönderilmez

### Veri Saklama
- **UserDefaults**: Favoriler ve sipariş geçmişi yerel olarak saklanır
- **Veri Güvenliği**: Hassas veri (kredi kartı, şifre) saklanmaz
- **Veri Paylaşımı**: Kullanıcı verileri üçüncü taraflarla paylaşılmaz

---

## 📝 Lisans ve Kullanım | License

Bu proje **Proprietary License (Özel Lisans)** altındadır. Tüm hakları saklıdır.

Detaylı lisans koşulları için [LICENSE](LICENSE) dosyasına bakın.

### Kullanım Koşulları (Terms of Use)

**İzin Verilen Kullanımlar**:
- ✅ Kişisel, eğitim ve değerlendirme amaçlı kullanım
- ✅ Kod yapısını inceleme ve öğrenme
- ✅ Akademik veya araştırma amaçlı referans (uygun atıf ile)

**Yasaklı Kullanımlar**:
- ❌ Ticari kullanım (açık izin olmadan)
- ❌ Kodun değiştirilmesi ve dağıtılması
- ❌ Tersine mühendislik veya kaynak kodu türetme
- ❌ Rekabet eden ürünler oluşturma

### Ticari Lisans

Ticari kullanım, dağıtım veya değişiklik için lütfen iletişime geçin:
- 📧 Email: [email protected]
- 🔗 GitHub: [@yourusername](https://github.com/yourusername)

---

**Alternatif**: Projeyi MIT Lisansı altında kullanmak isterseniz, `LICENSE-MIT` dosyasını `LICENSE` olarak yeniden adlandırabilirsiniz.

---

## 👨‍💻 Geliştirici Bilgileri | Developer

**Tahsin Mert Mutlu**
- 💼 iOS Geliştirici
- 📧 Email: [email protected]
- 🔗 GitHub: [@yourusername](https://github.com/yourusername)
- 🌐 Portfolio: [website.com](https://website.com)

---

## 🙏 Teşekkürler | Acknowledgments

- **SwiftUI Topluluğu**: Rehberlik ve kaynaklar için
- **Apple Developer Community**: Forum ve dokümantasyon desteği
- **Test Kullanıcıları**: Geri bildirim ve hata raporları için
- **Tüm Katkıda Bulunanlar**: Projeye katkı sağlayan herkese

---

## 📸 Ekran Görüntüleri | Screenshots

*Ekran görüntüleri yakında eklenecektir.*

Gelecek güncellemeler:
- Ana sayfa ekran görüntüsü
- Menü ekranı
- QR kod tarama
- Sepet ve sipariş onayı
- Sipariş durumu takibi

---

## 🔄 Versiyon Geçmişi | Changelog

### v1.0.0 (Kasım 2025) - İlk Sürüm
#### Yeni Özellikler
- ✅ **QR Kod Tarama**: Gerçek zamanlı kamera ile masa seçimi
- ✅ **Favoriler Sistemi**: Ürünleri favorilere ekleme ve hızlı erişim
- ✅ **Sipariş Geçmişi**: Geçmiş siparişleri görüntüleme
- ✅ **Sipariş Düzenleme**: Bekleyen siparişleri düzenleme
- ✅ **Çoklu Dil Desteği**: Türkçe ve İngilizce tam lokalizasyon
- ✅ **Sipariş Takibi**: Gerçek zamanlı sipariş durumu (Beklemede → Hazırlanıyor → Hazır)
- ✅ **Özel Notlar**: Siparişe özel talimatlar ekleme
- ✅ **Akıllı Arama**: Menü öğelerinde arama ve filtreleme
- ✅ **Ürün Detay Sayfası**: Detaylı ürün görüntüleme ve miktar seçimi
- ✅ **Haptic Feedback**: Dokunsal geri bildirimler

#### Teknik İyileştirmeler
- ✅ MVVM mimarisi ile temiz kod organizasyonu
- ✅ SwiftUI ile modern UI geliştirme
- ✅ AVFoundation ile kamera entegrasyonu
- ✅ UserDefaults ile yerel veri saklama
- ✅ Animasyonlar ve geçişler

---

## 🔗 İlgili Projeler | Related Projects

- [Cafe Management System](link) - Backend API
- [Admin Dashboard](link) - Yönetim paneli
- [Payment Integration](link) - Ödeme entegrasyonu

---

## 💡 Özellik İstekleri | Feature Requests

Gelecek sürümler için planlanan özellikler:
- [ ] Ödeme entegrasyonu (Apple Pay, Kredi Kartı)
- [ ] Push notification desteği
- [ ] Dark mode desteği
- [ ] Apple Watch uygulaması
- [ ] Widget desteği
- [ ] Sosyal medya entegrasyonu
- [ ] Yorum ve puanlama sistemi
- [ ] Kampanya ve indirimler

---

## 🐛 Hata Bildirimi | Bug Reports

Hata bulduysanız veya özellik önerisi yapmak isterseniz:
- GitHub Issues sayfasını kullanın
- Email ile iletişime geçin
- Detaylı açıklama ve ekran görüntüleri ekleyin

---

<div align="center">
  <strong>Amata ile kahve keyfinizi yaşayın! ☕✨</strong>
</div>

---

<a id="english-version"></a>
# ENGLISH VERSION

<div align="center">
  <img src="amata-logo.png" alt="Amata Cafe Order App Logo - Modern iOS Cafe Ordering System" width="300" height="auto"/>
  
  <h2>Premium Cafe Order App | iOS QR Code Ordering System</h2>
  
  <p><strong>Direct ordering experience from your table</strong></p>
  
  [![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
  [![iOS](https://img.shields.io/badge/iOS-17.0+-blue.svg)](https://developer.apple.com/ios/)
  [![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-green.svg)](https://developer.apple.com/xcode/swiftui/)
  [![License](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20iPadOS-lightgrey.svg)](https://developer.apple.com/)
</div>

---

## 📱 What is Amata? | About the Cafe Order App

**Amata** is a modern **mobile ordering app** developed for restaurants and cafes. This iOS app allows customers to place orders directly from their tables, offering advanced features such as **QR code scanning**, **menu management**, **order tracking**, and **favorites system**.

Amata delivers a **"premium yet cozy"** user experience that combines Apple's minimalism philosophy with the warm atmosphere of Parisian coffeehouses. The app is built using SwiftUI and MVVM architecture and runs on iOS 17+ devices.

## ✨ Amata Cafe App Features

### 📋 Menu and Ordering Features
- **Menu Management**: Rich menu display organized by categories (Coffee, Pastries, Cold Drinks, Snacks, Desserts)
- **Smart Search**: Real-time search and filtering of menu items
- **Product Detail Page**: Detailed product view with large images, descriptions, and quantity selection
- **Cart Management**: Easy order addition/removal and quantity control
- **Special Notes**: Add special instructions, allergy information, and custom requests to orders

### 📱 Technology and Innovation
- **QR Code Scanning**: Real-time camera for automatic table number selection
- **Order Tracking**: Real-time order status tracking (Pending → Preparing → Ready)
- **Favorites System**: Add frequently ordered products to favorites for quick access
- **Order History**: View past orders and reorder items

### 🌍 User Experience
- **Multi-language Support**: Full localization in Turkish and English
- **Custom Theme**: Minimal and elegant design in warm coffee tones (#EDE0D4, #DDB892, #B08968, #7F5539)
- **Animations**: Smooth spring animations for fluid transitions
- **Haptic Feedback**: Enhanced user interactions with tactile feedback
- **Adaptive UI**: Optimized interface for iPhone and iPad

---

## 🛠 Technology Stack | Technologies Used

Amata is built according to modern iOS development standards:

### Core Technologies
- **SwiftUI 5.0**: Apple's modern, declarative UI framework
- **Swift 5.9+**: Powerful and safe programming language
- **MVVM Architecture**: Clean code organization with Model-View-ViewModel pattern
- **Combine Framework**: Reactive programming and asynchronous data flow management

### Features & Integrations
- **AVFoundation**: Real-time camera integration for QR code scanning
- **UIKit**: UIKit integration with SwiftUI (for QR Scanner)
- **UserDefaults**: Local data storage (favorites, order history)
- **Haptic Feedback**: Tactile feedback with UINotificationFeedbackGenerator
- **Localization**: `.lproj` files for multi-language support

### Design & Animation
- **SF Rounded Font**: Consistent typography with Apple's system font
- **Custom Color Palette**: Special color palette in warm coffee tones
- **Spring Animations**: Smooth and natural animations
- **Matched Geometry Effects**: Fluid transition animations

---

## 📋 System Requirements | Minimum Requirements

### Development Environment
- **Xcode 15.0+**: Apple's official IDE
- **Swift 5.9+**: Modern Swift version
- **macOS 13.0+**: macOS version compatible with Xcode
- **iOS Simulator**: iOS simulator for testing

### Runtime Environment
- **iOS 17.0+**: Minimum iOS version
- **iPadOS 17.0+**: iPad support
- **Camera Access**: Required for QR code scanning feature (optional)
- **Device**: iPhone 8 and above, iPad (6th generation) and above

### Permissions
- **NSCameraUsageDescription**: Camera access required for QR code scanning

---

## 🚀 Installing Amata App | Installation Guide

### Quick Start

1. **Download or Clone the Project**:
```bash
git clone https://github.com/yourusername/amata.git
cd amata
```
or download as ZIP and extract.

2. **Open Project in Xcode**:
```bash
open tabli.xcodeproj
```
or double-click `tabli.xcodeproj` in Finder.

3. **Configure Signing & Profiles**:
   - Go to "Signing & Capabilities" section in Xcode
   - Select your development team
   - Xcode will automatically create a provisioning profile

4. **Select Simulator or Device**:
   - Select target device from top menu (iPhone 15 Pro, iPad Pro, etc.)

5. **Run the App**:
   - Press ⌘R or click Play button

### First Run Notes
- **Camera Permission**: Will request camera permission on first QR code scan attempt
- **Test Data**: App comes with sample menu data
- **Language Selection**: Default language is determined by system language

---

## 📖 Amata User Guide | Usage Instructions

### 🎯 First Time Setup

#### 1. Table Selection
- When the app opens, you need to select your table number
- **Manual Selection**: Click "Select Table" button to manually select table number
- **QR Code Scanning**: Click "Scan QR Code" button to scan table QR code with camera
  - After granting camera permission, QR code image is automatically detected
  - Valid QR code format: `table-5` or just `5` (table number)

#### 2. Menu Access
- Click "Start Order" button on home page to access menu
- Menu is organized by categories:
  - ☕ Coffee
  - 🥐 Pastries
  - 🧊 Cold Drinks
  - 🥗 Snacks
  - 🍰 Desserts

#### 3. Product Selection and Ordering
1. **Category Selection**: Select a category from top category buttons
2. **Product View**: Click product card to open detail page or click "+" button to add directly to cart
3. **Quantity Adjustment**: Increase/decrease quantity on product detail page
4. **Add to Cart**: Click "Add to Cart" button
5. **Cart Review**: Click cart icon on top right to view cart
6. **Special Notes**: Add special instructions, allergy information on cart page
7. **Order Confirmation**: Click "Place Order" button to confirm your order

#### 4. Order Tracking
- "Order Status" button appears on home page (if there's an active order)
- Order statuses:
  - ⏳ **Pending**: Order received, waiting to be prepared
  - 👨‍🍳 **Preparing**: Barista is preparing your order
  - ✅ **Ready**: Your order is ready, you can collect from counter

### 🚀 Advanced Features

#### ⭐ Favorites System
- **Add to Favorites**: Click star icon on product card to add to favorites
- **Favorites Page**: Access favorite products from "Favorites" button on home page
- **Quick Order**: Add directly to cart from favorites page

#### 📊 Order History
- **View History**: Click "History" button on home page to view past orders
- **Order Details**: Date, time, items, and total price for each order

#### 📝 Order Editing
- **Pending Orders**: You can edit orders when status is "Pending"
- **Order Details**: Click "Edit" button from order status page

#### 🌍 Language Change
- Click language button on top right of home page
- Select Turkish or English
- Language change applies app-wide

#### 🔍 Search Feature
- Type product name in search bar on menu page to search
- Search works across all categories

---

## 🏗 Amata Project Structure | Code Organization

Amata is organized using **MVVM (Model-View-ViewModel)** architecture:

```
tabli/
├── Models/                          # Data Models
│   ├── MenuItem.swift               # MenuItem, OrderItem, Table, MenuCategory
│   └── SampleData.swift             # Sample menu data and test data
│
├── ViewModels/                      # Business Logic Layer
│   └── OrderViewModel.swift        # Order, cart, favorites, history management
│
├── Views/                           # UI Layer (SwiftUI)
│   ├── SplashView.swift            # Splash screen and animations
│   ├── HomeView.swift              # Home page (table selection, menu access)
│   ├── MenuView.swift              # Menu display and category filtering
│   ├── ProductDetailView.swift     # Product detail page (image, description, quantity)
│   ├── CartView.swift              # Cart display and order placement
│   ├── OrderConfirmationView.swift # Order confirmation animation
│   ├── OrderStatusView.swift      # Order status tracking
│   ├── OrderDetailsView.swift     # Order detail display
│   ├── EditOrderView.swift        # Pending order editing
│   ├── FavoritesView.swift        # Favorite products page
│   ├── OrderHistoryView.swift     # Order history
│   ├── QRCodeScannerView.swift    # QR code scanning UI (SwiftUI)
│   ├── QRCodeScannerViewController.swift # QR code scanning (UIKit)
│   ├── QRCodeScannerRepresentable.swift # SwiftUI-UIKit bridge
│   ├── LanguagePickerView.swift   # Language selection
│   └── SettingsView.swift         # Settings page
│
├── Theme/                           # Design System
│   └── AppTheme.swift              # Color palette, font, animation settings
│
├── Localization/                    # Multi-language Support
│   ├── LocalizationManager.swift   # Language management and switching
│   ├── en.lproj/
│   │   └── Localizable.strings     # English translations
│   └── tr.lproj/
│       └── Localizable.strings     # Turkish translations
│
├── Assets.xcassets/                 # Images and Icons
│   ├── AppIcon.appiconset/         # App icon
│   ├── AmataLogo.imageset/         # Amata logo
│   └── AccentColor.colorset/       # Accent color
│
├── ContentView.swift                # Main view router
└── tabliApp.swift                   # App entry point
```

### 📦 Dependencies
Amata uses **no external dependencies**. All features are developed with native iOS frameworks:
- SwiftUI (UI)
- AVFoundation (Camera)
- Combine (Reactive Programming)
- UserDefaults (Local Storage)

---

## 🎨 Amata Design System | UI/UX Design

Amata adopts a **minimalist design language in warm coffee tones**. The design complies with Apple's Human Interface Guidelines.

### 🎨 Color Palette
| Color | Hex Code | Usage Area |
|-------|----------|------------|
| Beige Light | `#EDE0D4` | Background, cards |
| Beige Medium | `#DDB892` | Secondary backgrounds |
| Brown Medium | `#B08968` | Secondary text, lines |
| Brown Dark | `#7F5539` | Primary text, accents |
| Ivory | `#F5F1EB` | Card backgrounds |
| Cream | `#F9F6F2` | Main background |

### ✍️ Typography
- **Font Family**: SF Rounded (SF Rounded Pro)
- **Headings**: Bold, 24-32pt
- **Subheadings**: Semibold, 18-20pt
- **Body Text**: Regular, 14-16pt
- **Small Text**: Regular, 12-14pt

### ✨ Animations
- **Spring Animations**: `Animation.spring(response: 0.4, dampingFraction: 0.7)`
- **Duration**: 0.3-0.6 seconds
- **Transitions**: Fade, scale, slide combinations
- **Haptic Feedback**: Light, Medium, Heavy levels

### 📐 Layout Rules
- **Corner Radius**: 16pt-28pt (cards, buttons)
- **Padding**: 16pt-24pt (standard spacing)
- **Shadows**: Opacity 0.08-0.15, radius 10-20pt
- **Grid System**: 12-column responsive grid (for iPad)

### 🎯 UX Principles
- **Minimalism**: Avoiding unnecessary UI elements
- **Consistency**: Consistent design language across all screens
- **Accessibility**: Dynamic Type support, high contrast
- **Feedback**: Haptic feedback and visual feedback

---

## 🌍 Localization and Language Support

Amata app is developed with **multi-language support**:

### Supported Languages
- 🇹🇷 **Turkish**: Default language
- 🇬🇧 **English**: Secondary language support

### Localization Structure
```
Localization/
├── LocalizationManager.swift      # Language management system
├── en.lproj/
│   └── Localizable.strings       # English texts (90+ strings)
└── tr.lproj/
    └── Localizable.strings       # Turkish texts (90+ strings)
```

### Adding New Language
To add a new language:
1. Create new `.lproj` folder in `Localization/` directory (e.g., `de.lproj`)
2. Add `Localizable.strings` file
3. Translate all string keys
4. Add new language enum value to `LocalizationManager.swift`

### Localized Sections
- ✅ All UI texts
- ✅ Error messages
- ✅ Notifications
- ✅ Date/time formats
- ✅ Price formats (₺ vs $)

---

## 🔐 Security and Permissions | Privacy & Permissions

### Permissions Used
- **NSCameraUsageDescription**: Camera access for QR code scanning
  - **Description**: "We need camera access to scan QR codes to select your table number."
  - **Usage**: Only during QR code scanning process
  - **Privacy**: Camera data is processed on device, not sent to server

### Data Storage
- **UserDefaults**: Favorites and order history stored locally
- **Data Security**: Sensitive data (credit card, password) not stored
- **Data Sharing**: User data not shared with third parties

---

## 📝 License and Usage

This project is under **Proprietary License**. All rights reserved.

See [LICENSE](LICENSE) file for detailed license terms.

### Terms of Use

**Permitted Uses**:
- ✅ Personal, educational and evaluation purposes
- ✅ Review and study code structure
- ✅ Academic or research references (with proper attribution)

**Prohibited Uses**:
- ❌ Commercial use (without explicit permission)
- ❌ Modification and distribution of code
- ❌ Reverse engineering or deriving source code
- ❌ Creating competing products

### Commercial License

For commercial use, distribution, or modification, please contact:
- 📧 Email: [email protected]
- 🔗 GitHub: [@yourusername](https://github.com/yourusername)

---

**Alternative**: If you want to use the project under MIT License, you can rename `LICENSE-MIT` file as `LICENSE`.

---

## 👨‍💻 Developer Information

**Tahsin Mert Mutlu**
- 💼 iOS Developer
- 📧 Email: [email protected]
- 🔗 GitHub: [@yourusername](https://github.com/yourusername)
- 🌐 Portfolio: [website.com](https://website.com)

---

## 🙏 Acknowledgments

- **SwiftUI Community**: For guidance and resources
- **Apple Developer Community**: For forum and documentation support
- **Test Users**: For feedback and bug reports
- **All Contributors**: Everyone who contributed to the project

---

## 📸 Screenshots

*Screenshots will be added soon.*

Upcoming updates:
- Home screen screenshot
- Menu screen
- QR code scanning
- Cart and order confirmation
- Order status tracking

---

## 🔄 Version History | Changelog

### v1.0.0 (November 2025) - Initial Release
#### New Features
- ✅ **QR Code Scanning**: Real-time camera for table selection
- ✅ **Favorites System**: Add products to favorites and quick access
- ✅ **Order History**: View past orders
- ✅ **Order Editing**: Edit pending orders
- ✅ **Multi-language Support**: Full localization in Turkish and English
- ✅ **Order Tracking**: Real-time order status (Pending → Preparing → Ready)
- ✅ **Special Notes**: Add special instructions to orders
- ✅ **Smart Search**: Search and filter menu items
- ✅ **Product Detail Page**: Detailed product view and quantity selection
- ✅ **Haptic Feedback**: Tactile feedback

#### Technical Improvements
- ✅ Clean code organization with MVVM architecture
- ✅ Modern UI development with SwiftUI
- ✅ Camera integration with AVFoundation
- ✅ Local data storage with UserDefaults
- ✅ Animations and transitions

---

## 🔗 Related Projects

- [Cafe Management System](link) - Backend API
- [Admin Dashboard](link) - Management panel
- [Payment Integration](link) - Payment integration

---

## 💡 Feature Requests

Planned features for future releases:
- [ ] Payment integration (Apple Pay, Credit Card)
- [ ] Push notification support
- [ ] Dark mode support
- [ ] Apple Watch app
- [ ] Widget support
- [ ] Social media integration
- [ ] Review and rating system
- [ ] Campaigns and discounts

---

## 🐛 Bug Reports

If you find a bug or want to suggest a feature:
- Use GitHub Issues page
- Contact via email
- Include detailed description and screenshots

---

<div align="center">
  <strong>Enjoy your coffee with Amata! ☕✨</strong>
</div>

