import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    var onOrderComplete: (() -> Void)?
    @State private var showOrderConfirmation = false
    @State private var isPlacingOrder = false
    @Namespace private var itemNamespace
    
    init(viewModel: OrderViewModel, onOrderComplete: (() -> Void)? = nil) {
        self.viewModel = viewModel
        self.onOrderComplete = onOrderComplete
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                if viewModel.orderItems.isEmpty {
                    EmptyCartView()
                } else {
                    VStack(spacing: 0) {

                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(viewModel.orderItems) { orderItem in
                                    CartItemRow(
                                        orderItem: orderItem,
                                        viewModel: viewModel,
                                        namespace: itemNamespace
                                    )
                                    .transition(.asymmetric(
                                        insertion: .scale.combined(with: .opacity),
                                        removal: .scale.combined(with: .opacity)
                                    ))
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                        }
                        

                        VStack(spacing: 20) {

                            ZStack {
                                Divider()
                                    .background(AppTheme.brownMedium.opacity(0.2))
                                
                                LinearGradient(
                                    colors: [Color.clear, AppTheme.brownMedium.opacity(0.3), Color.clear],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                .frame(height: 1)
                            }
                            .padding(.horizontal, 20)
                            

                            HStack(spacing: 16) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("subtotal".localized)
                                        .font(.system(size: 15, weight: .medium, design: .rounded))
                                        .foregroundColor(AppTheme.brownMedium)
                                    
                                    Text("total".localized)
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 6) {
                                    Text("\(viewModel.itemCount) \(viewModel.itemCount == 1 ? "item".localized : "items".localized)")
                                        .font(.system(size: 15, weight: .medium, design: .rounded))
                                        .foregroundColor(AppTheme.brownMedium)
                                    
                                    Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", viewModel.totalPrice))
                                        .font(.system(size: 32, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                }
                            }
                            .padding(.horizontal, 20)
                            

                            VStack(alignment: .leading, spacing: 12) {
                                Text("special_notes".localized)
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    .foregroundColor(AppTheme.brownDark)
                                
                                TextField(
                                    "special_notes_placeholder".localized,
                                    text: $viewModel.specialNotes,
                                    axis: .vertical
                                )
                                .font(.system(size: 15, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                                .padding(14)
                                .background(AppTheme.beigeLight.opacity(0.5))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(AppTheme.brownMedium.opacity(0.2), lineWidth: 1.5)
                                )
                                .lineLimit(3...6)
                            }
                            .padding(.horizontal, 20)
                            

                            Button(action: {
                                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                impactFeedback.impactOccurred()
                                
                                isPlacingOrder = true
                                viewModel.placeOrder()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    showOrderConfirmation = true
                                    isPlacingOrder = false
                                }
                            }) {
                                HStack(spacing: 12) {
                                    if isPlacingOrder {
                                        ProgressView()
                                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                            .scaleEffect(1.2)
                                    } else {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 22))
                                        Text("place_order".localized)
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                    }
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .background(
                                    LinearGradient(
                                        colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
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
                            }
                            .padding(.horizontal, 20)
                            .disabled(isPlacingOrder)
                        }
                        .padding(.vertical, 24)
                        .background(
                            LinearGradient(
                                colors: [AppTheme.cardBackground, AppTheme.beigeLight.opacity(0.3)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                }
            }
            .navigationTitle("your_order".localized)
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
            .fullScreenCover(isPresented: $showOrderConfirmation) {
                OrderConfirmationView(viewModel: viewModel) {

                    onOrderComplete?()
                    dismiss()
                }
            }
        }
    }
}

struct CartItemRow: View {
    let orderItem: OrderItem
    @ObservedObject var viewModel: OrderViewModel
    let namespace: Namespace.ID
    @State private var isRemoving = false
    @State private var minusButtonScale: CGFloat = 1.0
    @State private var plusButtonScale: CGFloat = 1.0
    @State private var cardScale: CGFloat = 1.0
    
    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.6)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 85, height: 85)
                    .shadow(
                        color: AppTheme.brownMedium.opacity(0.2),
                        radius: 10,
                        x: 0,
                        y: 5
                    )
                
                Text(orderItem.menuItem.imageName)
                    .font(.system(size: 42))
            }
            

            VStack(alignment: .leading, spacing: 6) {
                Text(orderItem.menuItem.name)
                    .font(.system(size: 19, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
                    .lineLimit(1)
                
                Text("\(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", orderItem.menuItem.price)) \("each".localized)")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(AppTheme.brownMedium)
                

                Text("\("total".localized): \(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", orderItem.totalPrice))")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
            }
            
            Spacer()
            

            VStack(spacing: 12) {

                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                    
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        plusButtonScale = 1.3
                        cardScale = 1.02
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            plusButtonScale = 1.0
                            cardScale = 1.0
                        }
                    }
                    
                    viewModel.addItem(orderItem.menuItem)
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
                            .frame(width: 36, height: 36)
                            .shadow(
                                color: AppTheme.brownDark.opacity(0.3),
                                radius: 6,
                                x: 0,
                                y: 3
                            )
                        
                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(plusButtonScale)
                }
                .buttonStyle(.plain)
                

                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(AppTheme.beigeMedium.opacity(0.3))
                        .frame(width: 40, height: 32)
                    
                    Text("\(orderItem.quantity)")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.brownDark)
                }
                

                Button(action: {
                    let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                    impactFeedback.impactOccurred()
                    
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        minusButtonScale = 1.3
                        cardScale = 0.98
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                            minusButtonScale = 1.0
                            cardScale = 1.0
                        }
                    }
                    
                    viewModel.removeItem(orderItem)
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [AppTheme.brownMedium.opacity(0.8), AppTheme.brownMedium],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 36, height: 36)
                            .shadow(
                                color: AppTheme.brownMedium.opacity(0.2),
                                radius: 6,
                                x: 0,
                                y: 3
                            )
                        
                        Image(systemName: "minus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(minusButtonScale)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(20)
        .background(
            LinearGradient(
                colors: [AppTheme.cardBackground, AppTheme.beigeLight.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    LinearGradient(
                        colors: [AppTheme.brownMedium.opacity(0.2), AppTheme.brownMedium.opacity(0.05)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(
            color: AppTheme.brownDark.opacity(0.12),
            radius: 12,
            x: 0,
            y: 5
        )
        .scaleEffect(cardScale)
        .opacity(isRemoving ? 0.5 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isRemoving)
    }
}

struct EmptyCartView: View {
    @State private var animateEmoji = false
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                AppTheme.beigeMedium.opacity(0.3),
                                AppTheme.beigeLight.opacity(0.1)
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                    .scaleEffect(animateEmoji ? 1.1 : 1.0)
                    .opacity(animateEmoji ? 0.8 : 1.0)
                
                Text("🛒")
                    .font(.system(size: 100))
                    .scaleEffect(animateEmoji ? 1.1 : 1.0)
            }
            
            VStack(spacing: 12) {
                Text("Your cart is empty")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
                
                Text("Add items from the menu to get started")
                    .font(.system(size: 17, design: .rounded))
                    .foregroundColor(AppTheme.brownMedium)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .lineSpacing(4)
            }
        }
        .onAppear {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever(autoreverses: true)
            ) {
                animateEmoji = true
            }
        }
    }
}

#Preview {
    CartView(viewModel: OrderViewModel())
}
