import SwiftUI

struct ProductDetailView: View {
    let item: MenuItem
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    @State private var quantity: Int = 1
    @State private var imageScale: CGFloat = 1.0
    @State private var contentOpacity: Double = 0
    @State private var addButtonScale: CGFloat = 1.0
    @State private var showAddedAnimation = false
    
    private var itemQuantity: Int {
        viewModel.orderItems.first(where: { $0.menuItem.id == item.id })?.quantity ?? 0
    }
    
    private var totalPrice: Double {
        item.price * Double(quantity)
    }
    
    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {

                    ZStack {

                        LinearGradient(
                            colors: [
                                AppTheme.beigeMedium.opacity(0.4),
                                AppTheme.beigeLight.opacity(0.6)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 350)
                        .ignoresSafeArea(edges: .top)
                        

                        Text(item.imageName)
                            .font(.system(size: 140))
                            .scaleEffect(imageScale)
                            .shadow(color: AppTheme.brownDark.opacity(0.2), radius: 20, x: 0, y: 10)
                    }
                    .padding(.top, 20)
                    

                    VStack(alignment: .leading, spacing: 24) {

                        VStack(alignment: .leading, spacing: 12) {

                            HStack {
                                HStack {
                                    Text(item.category.icon)
                                        .font(.system(size: 16))
                                    
                                    Text(item.category.rawValue)
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(AppTheme.brownMedium)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(AppTheme.beigeLight.opacity(0.6))
                                .cornerRadius(12)
                                
                                Spacer()
                                

                                Button(action: {
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                    impactFeedback.impactOccurred()
                                    
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                        viewModel.toggleFavorite(item)
                                    }
                                }) {
                                    Image(systemName: viewModel.isFavorite(item) ? "heart.fill" : "heart")
                                        .font(.system(size: 22))
                                        .foregroundColor(viewModel.isFavorite(item) ? Color.red : AppTheme.brownMedium)
                                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: viewModel.isFavorite(item))
                                }
                                .buttonStyle(.plain)
                            }
                            

                            Text(item.name)
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                                .lineLimit(2)
                            

                            Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", item.price))
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        
                        Divider()
                            .background(AppTheme.brownMedium.opacity(0.2))
                            .padding(.horizontal, 24)
                        

                        VStack(alignment: .leading, spacing: 12) {
                            Text("description".localized)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                            
                            Text(item.description)
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                                .lineSpacing(6)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding(.horizontal, 24)
                        
                        Divider()
                            .background(AppTheme.brownMedium.opacity(0.2))
                            .padding(.horizontal, 24)
                            .padding(.top, 8)
                        

                        VStack(alignment: .leading, spacing: 16) {
                            Text("quantity".localized)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                                .padding(.horizontal, 24)
                            
                            HStack(spacing: 24) {
                                Spacer()
                                

                                Button(action: {
                                    if quantity > 1 {
                                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                        impactFeedback.impactOccurred()
                                        
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                            quantity -= 1
                                        }
                                    }
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(
                                                quantity > 1 ?
                                                LinearGradient(
                                                    colors: [AppTheme.brownMedium.opacity(0.8), AppTheme.brownMedium],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                ) :
                                                LinearGradient(
                                                    colors: [AppTheme.beigeMedium.opacity(0.5), AppTheme.beigeLight],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 50, height: 50)
                                            .shadow(
                                                color: AppTheme.brownMedium.opacity(0.2),
                                                radius: 8,
                                                x: 0,
                                                y: 4
                                            )
                                        
                                        Image(systemName: "minus")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(quantity > 1 ? .white : AppTheme.brownMedium.opacity(0.5))
                                    }
                                }
                                .disabled(quantity <= 1)
                                .buttonStyle(.plain)
                                

                                VStack(spacing: 4) {
                                    Text("\(quantity)")
                                        .font(.system(size: 36, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                    
                                    Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", totalPrice))
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .foregroundColor(AppTheme.brownMedium)
                                }
                                .frame(minWidth: 100)
                                

                                Button(action: {
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                    impactFeedback.impactOccurred()
                                    
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                        quantity += 1
                                    }
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
                                            .frame(width: 50, height: 50)
                                            .shadow(
                                                color: AppTheme.brownDark.opacity(0.3),
                                                radius: 8,
                                                x: 0,
                                                y: 4
                                            )
                                        
                                        Image(systemName: "plus")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                }
                                .buttonStyle(.plain)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 24)
                        }
                        .padding(.vertical, 16)
                        
                        Divider()
                            .background(AppTheme.brownMedium.opacity(0.2))
                            .padding(.horizontal, 24)
                        

                        Button(action: {
                            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                            impactFeedback.impactOccurred()
                            

                            for _ in 0..<quantity {
                                viewModel.addItem(item)
                            }
                            

                            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                                addButtonScale = 1.05
                                showAddedAnimation = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                                    addButtonScale = 1.0
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation {
                                        showAddedAnimation = false
                                    }
                                    dismiss()
                                }
                            }
                        }) {
                            HStack(spacing: 12) {
                                if showAddedAnimation {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 22))
                                        .transition(.scale.combined(with: .opacity))
                                } else {
                                    Image(systemName: "cart.fill")
                                        .font(.system(size: 22))
                                }
                                
                                Text(showAddedAnimation ? "added".localized : "add_to_cart".localized)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                
                                if !showAddedAnimation {
                                    Text("(\(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", totalPrice)))")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .opacity(0.8)
                                }
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(
                                LinearGradient(
                                    colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(28)
                            .shadow(
                                color: AppTheme.brownDark.opacity(0.4),
                                radius: 18,
                                x: 0,
                                y: 8
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 28)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                            .scaleEffect(addButtonScale)
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                        .padding(.bottom, 40)
                        

                        if itemQuantity > 0 {
                            HStack(spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(AppTheme.brownMedium)
                                
                                Text(String(format: "already_in_cart".localized, itemQuantity))
                                    .font(.system(size: 16, weight: .medium, design: .rounded))
                                    .foregroundColor(AppTheme.brownMedium)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(AppTheme.beigeLight.opacity(0.6))
                            .cornerRadius(16)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 20)
                        }
                    }
                    .opacity(contentOpacity)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .contextMenu {
            Button(action: {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                viewModel.toggleFavorite(item)
            }) {
                Label(
                    viewModel.isFavorite(item) ?
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Favorilerden Çıkar" : "Remove from Favorites") :
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Favorilere Ekle" : "Add to Favorites"),
                    systemImage: viewModel.isFavorite(item) ? "heart.slash.fill" : "heart.fill"
                )
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                imageScale = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeIn(duration: 0.4)) {
                    contentOpacity = 1.0
                }
            }
            

            if itemQuantity > 0 {
                quantity = itemQuantity
            }
        }
    }
}

#Preview {
    NavigationView {
        ProductDetailView(
            item: MenuItem.sampleMenu.first!,
            viewModel: OrderViewModel()
        )
    }
}
