import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategory: MenuCategory?
    
    var favoriteItemsByCategory: [MenuCategory: [MenuItem]] {
        Dictionary(grouping: viewModel.favoriteItems) { $0.category }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                if viewModel.favoriteItems.isEmpty {
                    EmptyFavoritesView()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 24) {
                            ForEach(MenuCategory.allCases) { category in
                                if let items = favoriteItemsByCategory[category], !items.isEmpty {
                                    VStack(alignment: .leading, spacing: 16) {

                                        HStack {
                                            Text(category.icon)
                                                .font(.system(size: 24))
                                            
                                            Text(category.localizedName)
                                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                                .foregroundColor(AppTheme.brownDark)
                                            
                                            Spacer()
                                            
                                            Text("\(items.count)")
                                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                                .foregroundColor(AppTheme.brownMedium)
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                                .background(AppTheme.beigeMedium.opacity(0.3))
                                                .cornerRadius(12)
                                        }
                                        .padding(.horizontal, 20)
                                        

                                        ForEach(items) { item in
                                            NavigationLink(destination: ProductDetailView(item: item, viewModel: viewModel)) {
                                                FavoriteItemRow(
                                                    item: item,
                                                    viewModel: viewModel
                                                )
                                            }
                                            .buttonStyle(.plain)
                                        }
                                        .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 20)
                    }
                }
            }
            .navigationTitle("favorites".localized)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppTheme.brownMedium)
                    }
                }
            }
        }
    }
}

struct FavoriteItemRow: View {
    let item: MenuItem
    @ObservedObject var viewModel: OrderViewModel
    @State private var removeScale: CGFloat = 1.0
    
    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Text(item.imageName)
                    .font(.system(size: 40))
            }
            

            VStack(alignment: .leading, spacing: 6) {
                Text(item.name)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(AppTheme.brownMedium)
                    .lineLimit(2)
                
                Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", item.price))
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
            }
            
            Spacer()
            

            Button(action: {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    removeScale = 1.2
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        removeScale = 1.0
                    }
                }
                
                viewModel.addItem(item)
            }) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                }
                .scaleEffect(removeScale)
            }
            .buttonStyle(.plain)
        }
        .padding(16)
        .background(AppTheme.cardBackground)
        .cornerRadius(20)
        .shadow(color: AppTheme.brownDark.opacity(0.08), radius: 10, x: 0, y: 4)
    }
}

struct EmptyFavoritesView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("⭐")
                .font(.system(size: 80))
            
            Text("no_favorites".localized)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(AppTheme.brownDark)
            
            Text("add_favorites_message".localized)
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(AppTheme.brownMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    FavoritesView(viewModel: OrderViewModel())
}
