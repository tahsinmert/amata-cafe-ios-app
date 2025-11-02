import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    var onOrderComplete: (() -> Void)?
    @State private var selectedCategory: MenuCategory = .coffee
    @State private var animateIn = false
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    @Namespace private var categoryNamespace
    @Namespace private var itemNamespace
    
    init(viewModel: OrderViewModel, onOrderComplete: (() -> Void)? = nil) {
        self.viewModel = viewModel
        self.onOrderComplete = onOrderComplete
    }
    
    var filteredItems: [MenuItem] {
        let categoryItems = viewModel.getMenuItems(for: selectedCategory)
        if searchText.isEmpty {
            return categoryItems
        }
        return categoryItems.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {

                    VStack(spacing: 12) {

                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(AppTheme.brownMedium)
                                .font(.system(size: 16))
                            
                            TextField("search".localized, text: $searchText)
                                .font(.system(size: 15, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                                .focused($isSearchFocused)
                                .submitLabel(.search)
                            
                            if !searchText.isEmpty {
                                Button(action: { 
                                    searchText = ""
                                    isSearchFocused = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(AppTheme.brownMedium)
                                        .font(.system(size: 16))
                                }
                            }
                            

                            if isSearchFocused {
                                Button(action: {
                                    isSearchFocused = false
                                }) {
                                    Text(LocalizationManager.shared.currentLanguage == .turkish ? "Kapat" : "Done")
                                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(AppTheme.beigeMedium.opacity(0.4))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background(AppTheme.cardBackground)
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(AppTheme.brownMedium.opacity(0.15), lineWidth: 1)
                        )
                        .padding(.horizontal, 20)
                        

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(MenuCategory.allCases) { category in
                                    MinimalCategoryButton(
                                        category: category,
                                        isSelected: selectedCategory == category,
                                        namespace: categoryNamespace,
                                        itemCount: viewModel.getMenuItems(for: category).count
                                    ) {
                                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                        impactFeedback.impactOccurred()
                                        
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                            selectedCategory = category
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 12)
                    .background(AppTheme.cardBackground.opacity(0.8))
                    .shadow(color: AppTheme.brownDark.opacity(0.05), radius: 4, x: 0, y: 2)
                    

                    if filteredItems.isEmpty {
                        VStack(spacing: 20) {
                            Spacer()
                            Text("🔍")
                                .font(.system(size: 60))
                            Text("no_items_found".localized)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                            Text(searchText.isEmpty ?
                                 "select_category".localized :
                                 "try_different_search".localized)
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(Array(filteredItems.enumerated()), id: \.element.id) { index, item in
                                    NavigationLink(destination: ProductDetailView(item: item, viewModel: viewModel)) {
                                        EnhancedMenuItemCard(
                                            item: item,
                                            viewModel: viewModel,
                                            namespace: itemNamespace
                                        )
                                    }
                                    .buttonStyle(.plain)
                                    .simultaneousGesture(
                                        LongPressGesture(minimumDuration: 0.3)
                                            .onEnded { _ in
                                                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                                impactFeedback.impactOccurred()
                                            }
                                    )
                                    .opacity(animateIn ? 1.0 : 0)
                                    .offset(y: animateIn ? 0 : 30)
                                    .animation(
                                        .spring(response: 0.4, dampingFraction: 0.7)
                                        .delay(Double(index) * 0.05),
                                        value: animateIn
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                        }
                        .scrollDismissesKeyboard(.interactively)
                    }
                    

                    if viewModel.itemCount > 0 {
                        EnhancedCartSummaryBar(
                            viewModel: viewModel,
                            onOrderComplete: {
                                onOrderComplete?()
                                dismiss()
                            }
                        )
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                if isSearchFocused {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Button(action: {
                                isSearchFocused = false
                            }) {
                                Text(LocalizationManager.shared.currentLanguage == .turkish ? "Kapat" : "Done")
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .foregroundColor(AppTheme.brownDark)
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Image("AmataLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppTheme.brownMedium)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: CartView(viewModel: viewModel) {
                        onOrderComplete?()
                        dismiss()
                    }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 18))
                                .foregroundColor(AppTheme.brownDark)
                            
                            if viewModel.itemCount > 0 {
                                Text(viewModel.itemCount > 99 ? "99+" : "\(viewModel.itemCount)")
                                    .font(.system(size: 8, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .frame(minWidth: viewModel.itemCount > 99 ? 20 : 16, minHeight: 16)
                                    .padding(.horizontal, viewModel.itemCount > 99 ? 3 : 2)
                                    .padding(.vertical, 2)
                                    .background(
                                        Capsule()
                                            .fill(AppTheme.brownDark)
                                    )
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.white, lineWidth: 1.5)
                                    )
                                    .offset(x: 6, y: -6)
                            }
                        }
                    }
                }
            }
            .onAppear {
                withAnimation {
                    animateIn = true
                }
            }
        }
    }
}

struct MinimalCategoryButton: View {
    let category: MenuCategory
    let isSelected: Bool
    let namespace: Namespace.ID
    let itemCount: Int
    let action: () -> Void
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                scale = 0.95
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    scale = 1.0
                }
            }
            
            action()
        }) {
            HStack(spacing: 8) {

                Text(category.icon)
                    .font(.system(size: 18))
                    .opacity(isSelected ? 1.0 : 0.7)
                

                    Text(category.localizedName)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(isSelected ? .white : AppTheme.brownDark)
                    .lineLimit(1)
                

                if itemCount > 0 {
                    Text("\(itemCount)")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(isSelected ? .white.opacity(0.9) : AppTheme.brownMedium)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(isSelected ? Color.white.opacity(0.2) : AppTheme.beigeMedium.opacity(0.4))
                        )
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                Group {
                    if isSelected {
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .matchedGeometryEffect(id: "selectedCategory", in: namespace)
                    } else {
                        Capsule()
                            .fill(AppTheme.beigeLight.opacity(0.6))
                    }
                }
            )
            .overlay(
                Capsule()
                    .stroke(
                        isSelected ?
                        Color.white.opacity(0.2) :
                        AppTheme.brownMedium.opacity(0.15),
                        lineWidth: isSelected ? 1 : 1
                    )
            )
            .shadow(
                color: isSelected ?
                AppTheme.brownDark.opacity(0.25) :
                AppTheme.brownDark.opacity(0.03),
                radius: isSelected ? 6 : 2,
                x: 0,
                y: isSelected ? 3 : 1
            )
            .scaleEffect(scale)
        }
        .buttonStyle(.plain)
    }
}

struct EnhancedMenuItemCard: View {
    let item: MenuItem
    @ObservedObject var viewModel: OrderViewModel
    let namespace: Namespace.ID
    @State private var addButtonScale: CGFloat = 1.0
    @State private var cardScale: CGFloat = 1.0
    @State private var quantity: Int = 0
    
    private var itemQuantity: Int {
        viewModel.orderItems.first(where: { $0.menuItem.id == item.id })?.quantity ?? 0
    }
    
    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(
                        color: AppTheme.brownMedium.opacity(0.15),
                        radius: 8,
                        x: 0,
                        y: 4
                    )
                
                Text(item.imageName)
                    .font(.system(size: 50))
            }
            

            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(AppTheme.brownMedium)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", item.price))
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.brownDark)
                    

                    Button(action: {
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                        
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            viewModel.toggleFavorite(item)
                        }
                    }) {
                        Image(systemName: viewModel.isFavorite(item) ? "star.fill" : "star")
                            .font(.system(size: 20))
                            .foregroundColor(viewModel.isFavorite(item) ? Color.yellow : AppTheme.brownMedium)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: viewModel.isFavorite(item))
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    

                    if itemQuantity > 0 {
                        HStack(spacing: 8) {
                            Button(action: {
                                if let orderItem = viewModel.orderItems.first(where: { $0.menuItem.id == item.id }) {
                                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                    impactFeedback.impactOccurred()
                                    viewModel.removeItem(orderItem)
                                }
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(AppTheme.brownMedium)
                            }
                            
                            Text("\(itemQuantity)")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                                .frame(minWidth: 25)
                            
                            Button(action: {
                                let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                impactFeedback.impactOccurred()
                                viewModel.addItem(item)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(AppTheme.brownDark)
                            }
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }
            }
            

            if itemQuantity == 0 {
                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                    impactFeedback.impactOccurred()
                    
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        addButtonScale = 1.3
                        cardScale = 1.03
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            addButtonScale = 1.0
                            cardScale = 1.0
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
                            .frame(width: 56, height: 56)
                            .shadow(
                                color: AppTheme.brownDark.opacity(0.4),
                                radius: 10,
                                x: 0,
                                y: 5
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                            )
                        
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(addButtonScale)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(20)
        .background(AppTheme.cardBackground)
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    LinearGradient(
                        colors: [AppTheme.brownMedium.opacity(0.15), AppTheme.brownMedium.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(
            color: AppTheme.brownDark.opacity(0.12),
            radius: 14,
            x: 0,
            y: 5
        )
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(AppTheme.beigeLight.opacity(0.3))
                .blur(radius: 20)
                .offset(y: 10)
                .opacity(0.5)
        )
        .scaleEffect(cardScale)
        .contextMenu {

            Button(action: {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                
                viewModel.addItem(item)
            }) {
                Label(
                    itemQuantity > 0 ? 
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Sepete Ekle (Zaten \(itemQuantity) adet)" : "Add to Cart (\(itemQuantity) in cart)") :
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Sepete Ekle" : "Add to Cart"),
                    systemImage: "cart.badge.plus"
                )
            }
            
            Button(action: {
                let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                impactFeedback.impactOccurred()
                

            }) {
                Label(
                    LocalizationManager.shared.currentLanguage == .turkish ? "Detayları Görüntüle" : "View Details",
                    systemImage: "info.circle"
                )
            }
            
            if itemQuantity > 0 {
                Button(role: .destructive, action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
                    impactFeedback.impactOccurred()
                    
                    if let orderItem = viewModel.orderItems.first(where: { $0.menuItem.id == item.id }) {
                        viewModel.deleteItem(orderItem)
                    }
                }) {
                    Label(
                        LocalizationManager.shared.currentLanguage == .turkish ? "Sepetten Çıkar" : "Remove from Cart",
                        systemImage: "trash"
                    )
                }
            }
            

            Button(action: {
                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                impactFeedback.impactOccurred()
                viewModel.toggleFavorite(item)
            }) {
                Label(
                    viewModel.isFavorite(item) ?
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Favorilerden Çıkar" : "Remove from Favorites") :
                    (LocalizationManager.shared.currentLanguage == .turkish ? "Favorilere Ekle" : "Add to Favorites"),
                    systemImage: viewModel.isFavorite(item) ? "star.slash.fill" : "star.fill"
                )
            }
        } preview: {

            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {

                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                LinearGradient(
                                    colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.5)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 200, height: 200)
                            .shadow(
                                color: AppTheme.brownMedium.opacity(0.2),
                                radius: 15,
                                x: 0,
                                y: 8
                            )
                        
                        Text(item.imageName)
                            .font(.system(size: 100))
                    }
                    

                    VStack(spacing: 12) {
                        Text(item.name)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                            .multilineTextAlignment(.center)
                        
                        Text(item.description)
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(AppTheme.brownMedium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                        
                        Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", item.price))
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                        
                        if itemQuantity > 0 {
                            Text("\(itemQuantity) \(itemQuantity == 1 ? "item".localized : "items".localized) \(LocalizationManager.shared.currentLanguage == .turkish ? "sepetinde" : "in cart")")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(AppTheme.beigeMedium.opacity(0.3))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(40)
            }
        }
        .onChange(of: itemQuantity) { newValue in
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                quantity = newValue
            }
        }
    }
}

struct EnhancedCartSummaryBar: View {
    @ObservedObject var viewModel: OrderViewModel
    var onOrderComplete: (() -> Void)?
    @State private var isVisible = false
    @State private var pulseScale: CGFloat = 1.0
    
    init(viewModel: OrderViewModel, onOrderComplete: (() -> Void)? = nil) {
        self.viewModel = viewModel
        self.onOrderComplete = onOrderComplete
    }
    
    var body: some View {
        NavigationLink(destination: CartView(viewModel: viewModel) {
            onOrderComplete?()
        }) {
            HStack(spacing: 12) {

                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "cart.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("\(viewModel.itemCount) \(viewModel.itemCount == 1 ? "item".localized : "items".localized)")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(1)
                    
                    Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", viewModel.totalPrice))
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [AppTheme.brownDark, AppTheme.brownMedium],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(24, corners: [.topLeft, .topRight])
            .shadow(
                color: AppTheme.brownDark.opacity(0.4),
                radius: 15,
                x: 0,
                y: -6
            )
            .scaleEffect(pulseScale)
        }
        .buttonStyle(.plain)
        .opacity(isVisible ? 1 : 0)
        .onAppear {
            withAnimation {
                isVisible = true
            }
            

            withAnimation(
                .easeInOut(duration: 1.5)
                .repeatForever(autoreverses: true)
            ) {
                pulseScale = 1.02
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    MenuView(viewModel: OrderViewModel())
}
