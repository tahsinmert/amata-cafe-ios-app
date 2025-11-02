# Changelog | Değişiklik Geçmişi

Tüm önemli değişiklikler bu dosyada belgelenecektir.

Format [Keep a Changelog](https://keepachangelog.com/tr/1.0.0/) baz alınarak hazırlanmıştır,
ve bu proje [Semantic Versioning](https://semver.org/lang/tr/) kullanmaktadır.

## [Unreleased] | Yayınlanmamış

## [1.1.0] - 2024-12-XX

### ✨ Added | Eklenenler

#### Modern Tasarım Özellikleri
- **Glassmorphism**: Ultra thin material efektleri ile şeffaf kartlar ve butonlar
- **Parallax Scrolling**: Derinlik hissi veren parallax scroll efektleri tüm sayfalarda
- **3D Effects**: Rotation ve perspective efektleri ile 3D görünümler
- **Floating Elements**: Yüzen butonlar, kartlar ve animasyonlu öğeler
- **Gradient Backgrounds**: Canlı gradient animasyonları ve geçişler
- **Particle Effects**: Arka plan parçacık efektleri ve coffee steam animasyonları
- **Shimmer Effects**: Yanıp sönen ışık efektleri (shimmer) butonlarda ve kartlarda
- **Staggered Animations**: Kademeli animasyonlar ile akıcı geçişler
- **Glow Effects**: Radial glow efektleri ve expanding glow rings

#### Yeni Özellikler
- **Kullanıcı Profili**: Profil oluşturma, fotoğraf yükleme, istatistikler görüntüleme
- **Modern Splash Screen**: Coffee steam, particles, glow effects ile animasyonlu açılış
- **Coffee Steam Animation**: Logo üzerinde yükselen kahve buharı efekti
- **Haptic Touch Support**: Ürün kartlarında context menu ile hızlı işlemler

#### Tasarım İyileştirmeleri
- **Tüm Sayfalar Modernize**: CartView, OrderConfirmationView, FavoritesView, OrderHistoryView, OrderStatusView, ProfileView, QRCodeScannerView, ProductDetailView tamamen yenilendi
- **Modern Menü Tasarımı**: Parallax hero section, floating category pills, staggered product grid
- **Modern Sepet Tasarımı**: Floating summary card, 3D item cards, shimmer effects
- **Modern Sipariş Onay**: Expanding rings, particle confetti, modern animations
- **HomeView Optimizasyonu**: Tüm öğeler tek sayfaya sığacak şekilde optimize edildi

### 🐛 Fixed | Düzeltilenler

- Splash screen geçiş animasyonları düzeltildi
- CartView'de alt kısımda kalan ürünler sorunu çözüldü
- HomeView'de buton tepki sorunları düzeltildi
- Text fitting sorunları çözüldü (.lineLimit ve .minimumScaleFactor eklendi)
- Logo animasyonu düzeltildi (rotation yerine coffee steam animasyonu)

### 📝 Changed | Değiştirilenler

- Tüm sayfaların tasarımı modern ve şaşırtıcı bir yaklaşımla yenilendi
- README dosyası güncel özelliklerle güncellendi
- Proje yapısına User model ve UserProfileViewModel eklendi

---

## [1.0.0] - 2024-11-XX

### ✨ Added | Eklenenler

#### Temel Özellikler
- **QR Kod Tarama**: Gerçek zamanlı kamera ile masa seçimi
- **Menü Yönetimi**: Kategorilere ayrılmış menü görüntüleme
- **Ürün Detay Sayfası**: Detaylı ürün görüntüleme ve miktar seçimi
- **Sepet Yönetimi**: Sepete ürün ekleme/çıkarma ve miktar kontrolü
- **Sipariş Verme**: Sipariş oluşturma ve onaylama
- **Sipariş Takibi**: Gerçek zamanlı sipariş durumu (Beklemede → Hazırlanıyor → Hazır)

#### Gelişmiş Özellikler
- **Favoriler Sistemi**: Ürünleri favorilere ekleme ve hızlı erişim
- **Sipariş Geçmişi**: Geçmiş siparişleri görüntüleme
- **Sipariş Düzenleme**: Bekleyen siparişleri düzenleme
- **Özel Notlar**: Siparişe özel talimatlar ekleme
- **Akıllı Arama**: Menü öğelerinde arama ve filtreleme

#### Kullanıcı Deneyimi
- **Çoklu Dil Desteği**: Türkçe ve İngilizce tam lokalizasyon
- **Animasyonlar**: Yumuşak spring animasyonları
- **Haptic Feedback**: Dokunsal geri bildirimler
- **Adaptif UI**: iPhone ve iPad için optimize edilmiş arayüz

### 🛠 Technical | Teknik

- MVVM mimarisi ile temiz kod organizasyonu
- SwiftUI ile modern UI geliştirme
- AVFoundation ile kamera entegrasyonu
- UserDefaults ile yerel veri saklama
- Combine Framework ile reactive programlama

---

## [Unreleased] | Gelecek Özellikler

### 🚧 Planned | Planlanan

- [ ] Ödeme entegrasyonu (Apple Pay, Kredi Kartı)
- [ ] Push notification desteği
- [ ] Dark mode desteği
- [ ] Apple Watch uygulaması
- [ ] Widget desteği
- [ ] Sosyal medya entegrasyonu
- [ ] Yorum ve puanlama sistemi
- [ ] Kampanya ve indirimler
- [ ] Backend API entegrasyonu

---

**Note**: Versiyon numaraları [Semantic Versioning](https://semver.org/) formatına uygundur:
- **MAJOR** versiyon: Geriye dönük uyumsuz API değişiklikleri
- **MINOR** versiyon: Geriye dönük uyumlu yeni özellikler
- **PATCH** versiyon: Geriye dönük uyumlu hata düzeltmeleri

