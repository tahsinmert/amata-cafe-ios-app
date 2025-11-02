# Contributing to Amata

Amata'ya katkıda bulunmak istediğiniz için teşekkür ederiz! 🎉

Bu dosya, projeye katkıda bulunma sürecinizi kolaylaştırmak için hazırlanmıştır.

## 📋 Katkıda Bulunma Rehberi | Contributing Guidelines

### 🚀 Başlangıç (Getting Started)

1. **Repository'yi Fork edin** (Fork the Repository)
   - GitHub üzerinden repository'yi fork edin

2. **Local'e Klonlayın** (Clone to Local)
   ```bash
   git clone https://github.com/YOUR_USERNAME/amata-cafe-ios-app.git
   cd amata-cafe-ios-app
   ```

3. **Branch Oluşturun** (Create Branch)
   ```bash
   git checkout -b feature/your-feature-name
   # veya
   git checkout -b fix/your-bug-fix
   ```

### 💻 Geliştirme (Development)

#### Kod Standartları (Code Standards)

- **Dil**: Swift 5.9+
- **Framework**: SwiftUI (iOS 17+)
- **Mimari**: MVVM (Model-View-ViewModel)
- **Stil**: Apple'ın Swift Style Guide'ına uygun
- **Yorumlar**: Önemli fonksiyonlar için İngilizce veya Türkçe yorumlar

#### Proje Yapısı (Project Structure)

```
tabli/
├── Models/           # Veri modelleri
├── ViewModels/       # İş mantığı
├── Views/            # UI bileşenleri
├── Theme/            # Tasarım sistemi
└── Localization/     # Dil dosyaları
```

#### Yeni Özellik Ekleme (Adding New Features)

1. **Özellik Planlaması**
   - Issue açarak özellik önerisi yapın
   - Özellik detaylarını açıklayın
   - UI/UX tasarım gereksinimlerini belirtin

2. **Geliştirme Süreci**
   - MVVM mimarisine uygun kodlayın
   - Yeni dosyalar oluştururken mevcut yapıyı takip edin
   - Lokalizasyon için Türkçe ve İngilizce string'leri ekleyin

3. **Test**
   - Kodunuzu test edin
   - Farklı cihazlarda (iPhone/iPad) kontrol edin
   - Animasyonların düzgün çalıştığından emin olun

#### Hata Düzeltme (Bug Fixes)

1. **Hata Raporlama** (Bug Reporting)
   - Issue açarak hatayı detaylıca açıklayın
   - Ekran görüntüleri ekleyin
   - Hatayı nasıl tekrar üretebileceğinizi belirtin

2. **Hata Düzeltme** (Fixing Bugs)
   - Branch oluşturun (`fix/bug-description`)
   - Hatayı düzeltin
   - Test edin
   - Pull Request oluşturun

### 📝 Pull Request (PR) Süreci

#### PR Oluşturma (Creating PR)

1. **Değişiklikleri Commit edin**
   ```bash
   git add .
   git commit -m "feat: yeni özellik açıklaması"
   # veya
   git commit -m "fix: hata düzeltmesi açıklaması"
   ```

2. **Push edin**
   ```bash
   git push origin feature/your-feature-name
   ```

3. **GitHub'da Pull Request oluşturun**
   - Title: Değişiklikleri özetleyen başlık
   - Description: Detaylı açıklama
   - Related Issues: İlgili issue numaraları

#### PR Kontrol Listesi (PR Checklist)

- [ ] Kod MVVM mimarisine uygun
- [ ] Yeni özellik için lokalizasyon eklendi (TR/EN)
- [ ] Kod test edildi
- [ ] iPhone ve iPad'de test edildi
- [ ] Yorumlar ve dokümantasyon güncel
- [ ] README güncellendi (gerekirse)
- [ ] Kod standartlarına uygun

#### Commit Mesajları (Commit Messages)

Önerilen format:
```
feat: yeni özellik açıklaması
fix: hata düzeltmesi açıklaması
docs: dokümantasyon güncellemesi
style: kod formatı değişiklikleri
refactor: kod yeniden yapılandırma
test: test ekleme/düzeltme
chore: diğer değişiklikler
```

### 🎨 Tasarım Standartları (Design Standards)

- **Renkler**: `AppTheme.swift` içindeki renk paletini kullanın
- **Fontlar**: SF Rounded kullanın
- **Animasyonlar**: Spring animasyonlar kullanın
- **Erişilebilirlik**: Dynamic Type desteği ekleyin
- **Responsive**: iPhone ve iPad için uyumlu tasarım

### 🌍 Lokalizasyon (Localization)

Yeni string eklerken:
1. `Localization/tr.lproj/Localizable.strings` dosyasına Türkçe ekleyin
2. `Localization/en.lproj/Localizable.strings` dosyasına İngilizce ekleyin
3. `String.localized` extension'ını kullanın

### ✅ Code Review Süreci

1. **Review Bekleme**: PR oluşturduktan sonra maintainer'dan review bekleyin
2. **Değişiklikler**: Review sonrası gerekli değişiklikleri yapın
3. **Onay**: Review onaylandıktan sonra merge edilecektir

### 🐛 Hata Bildirimi (Bug Reports)

Hata bulduysanız:
- GitHub Issues sayfasında yeni issue açın
- **Başlık**: Hatanın kısa açıklaması
- **Açıklama**: 
  - Hatayı nasıl ürettiğiniz
  - Beklenen davranış
  - Gerçekleşen davranış
  - Ekran görüntüleri
  - Cihaz ve iOS versiyonu

### 💡 Özellik İstekleri (Feature Requests)

Yeni özellik önerirken:
- GitHub Issues sayfasında "Feature Request" etiketi ile issue açın
- Özelliğin amacını ve faydasını açıklayın
- UI/UX önerileri ekleyin (isteğe bağlı)

### 📚 Sorular (Questions)

Sorularınız için:
- GitHub Discussions kullanabilirsiniz
- Issue açabilirsiniz (Question etiketi ile)

### 🙏 Teşekkürler (Thanks)

Katkıda bulunan herkese teşekkür ederiz! Her katkı, Amata'yı daha iyi bir uygulama haline getirmek için önemlidir.

---

**Not**: Bu proje proprietary lisans altındadır. Katkıda bulunarak, katkılarınızın bu lisans altında kullanılabileceğini kabul etmiş olursunuz.

