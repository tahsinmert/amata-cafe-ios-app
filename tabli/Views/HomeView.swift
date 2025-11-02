import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: OrderViewModel
    @ObservedObject var localizationManager = LocalizationManager.shared
    @State private var isAnimating = false
    @State private var showTableSelection = false
    @State private var selectedTable: Table?
    @State private var showMenu = false
    @State private var showOrderStatus = false
    @State private var showSettings = false
    @State private var showLanguagePicker = false
    @State private var showFavorites = false
    @State private var showOrderHistory = false
    @State private var showQRScanner = false
    
    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {

                HStack {
                    Spacer()
                    
                    Button(action: {
                        showLanguagePicker = true
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "globe")
                                .font(.system(size: 16))
                            Text(localizationManager.currentLanguage == .turkish ? "TR" : "EN")
                                .font(.system(size: 14, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(AppTheme.brownDark)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(AppTheme.beigeMedium.opacity(0.3))
                        .cornerRadius(16)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 10)
                }
                
                Spacer()
                

                VStack(spacing: 16) {
                    Image("AmataLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                        .animation(
                            .easeInOut(duration: 2.0)
                            .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
                .padding(.top, 60)
                
                Spacer()
                

                if let table = viewModel.currentTable {
                    VStack(spacing: 12) {
                            Text("table".localized)
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                        
                        Text("\(table.number)")
                            .font(.system(size: 64, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                            .transition(.scale.combined(with: .opacity))
                    }
                    .padding(.vertical, 20)
                } else {
                    Button(action: {
                        withAnimation {
                            showTableSelection = true
                        }
                    }) {
                        HStack {
                            Image(systemName: "number")
                            Text("select_table".localized)
                        }
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(AppTheme.brownDark)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 16)
                        .background(AppTheme.beigeMedium.opacity(0.3))
                        .cornerRadius(20)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
                
                Spacer()
                

                VStack(spacing: 16) {

                    Button(action: {
                        if viewModel.currentTable == nil {
                            showTableSelection = true
                        } else {
                            showMenu = true
                        }
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 20))
                            Text("start_order".localized)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
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
                        .cornerRadius(25)
                        .shadow(color: AppTheme.brownDark.opacity(0.3), radius: 15, x: 0, y: 8)
                        .scaleEffect(isAnimating ? 1.02 : 1.0)
                        .animation(
                            .easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                    }
                    

                    VStack(spacing: 12) {

                        Button(action: {
                            showQRScanner = true
                        }) {
                            HStack(spacing: 12) {
                                Image(systemName: "qrcode.viewfinder")
                                    .font(.system(size: 18))
                                Text("scan_qr_code".localized)
                                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                            }
                            .foregroundColor(AppTheme.brownDark)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(AppTheme.beigeMedium.opacity(0.3))
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(AppTheme.brownMedium.opacity(0.3), lineWidth: 1.5)
                            )
                        }
                        

                        HStack(spacing: 12) {

                            Button(action: {
                                showFavorites = true
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 16))
                                    Text("favorites".localized)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                }
                                .foregroundColor(AppTheme.brownDark)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(AppTheme.beigeMedium.opacity(0.3))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(AppTheme.brownMedium.opacity(0.3), lineWidth: 1.5)
                                )
                            }
                            

                            Button(action: {
                                showOrderHistory = true
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "clock.arrow.circlepath")
                                        .font(.system(size: 16))
                                    Text("order_history".localized)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                }
                                .foregroundColor(AppTheme.brownDark)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(AppTheme.beigeMedium.opacity(0.3))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(AppTheme.brownMedium.opacity(0.3), lineWidth: 1.5)
                                )
                            }
                        }
                        

                        if viewModel.orderStatus != .none {
                            Button(action: {
                                showOrderStatus = true
                            }) {
                                HStack(spacing: 12) {
                                    Image(systemName: "clock.fill")
                                        .font(.system(size: 18))
                                    Text("order_status".localized)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                }
                                .foregroundColor(AppTheme.brownDark)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(AppTheme.beigeMedium.opacity(0.3))
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(AppTheme.brownMedium.opacity(0.5), lineWidth: 2)
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            isAnimating = true
        }
        .sheet(isPresented: $showTableSelection) {
            TableSelectionView(
                selectedTable: $selectedTable,
                onSelect: { table in
                    viewModel.currentTable = table
                    showTableSelection = false
                }
            )
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .fullScreenCover(isPresented: $showMenu) {
            MenuView(viewModel: viewModel) {
                showMenu = false
            }
        }
        .sheet(isPresented: $showOrderStatus) {
            OrderStatusView(viewModel: viewModel)
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .sheet(isPresented: $showLanguagePicker) {
            LanguagePickerView()
        }
        .sheet(isPresented: $showFavorites) {
            FavoritesView(viewModel: viewModel)
        }
        .sheet(isPresented: $showOrderHistory) {
            OrderHistoryView(viewModel: viewModel)
        }
        .sheet(isPresented: $showQRScanner) {
            QRCodeScannerView(viewModel: viewModel)
        }
    }
}

struct TableSelectionView: View {
    @Binding var selectedTable: Table?
    let onSelect: (Table) -> Void
    @Environment(\.dismiss) var dismiss
    @State private var animateIn = false
    @Namespace private var tableNamespace
    

    private var gridColumns: [GridItem] {
        let itemSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 120 : 90
        let spacing: CGFloat = 20
        let padding: CGFloat = 40
        let availableWidth = UIScreen.main.bounds.width - padding * 2
        let columnsCount = Int((availableWidth + spacing) / (itemSize + spacing))
        return Array(repeating: GridItem(.flexible(), spacing: spacing), count: max(3, columnsCount))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {

                        VStack(spacing: 12) {
                            Text("🪑")
                                .font(.system(size: 60))
                                .scaleEffect(animateIn ? 1.0 : 0.8)
                                .opacity(animateIn ? 1.0 : 0)
                            
                            Text("select_your_table".localized)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                            
                            Text("choose_table_message".localized)
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        

                        LazyVGrid(columns: gridColumns, spacing: 20) {
                            ForEach(Table.availableTables) { table in
                                TableCard(
                                    table: table,
                                    isSelected: selectedTable?.id == table.id,
                                    namespace: tableNamespace
                                ) {

                                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                    impactFeedback.impactOccurred()
                                    
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                                        selectedTable = table
                                    }
                                    

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        onSelect(table)
                                        dismiss()
                                    }
                                }
                                .opacity(animateIn ? 1.0 : 0)
                                .offset(y: animateIn ? 0 : 20)
                                .animation(
                                    .spring(response: 0.4, dampingFraction: 0.7)
                                    .delay(Double(table.id) * 0.03),
                                    value: animateIn
                                )
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppTheme.brownMedium)
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

struct TableCard: View {
    let table: Table
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                scale = 1.15
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    scale = 1.0
                }
            }
            
            action()
        }) {
            VStack(spacing: 8) {

                ZStack {
                    Circle()
                        .fill(
                            isSelected ?
                            LinearGradient(
                                colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ) :
                            LinearGradient(
                                colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                        .shadow(
                            color: isSelected ?
                            AppTheme.brownDark.opacity(0.3) :
                            AppTheme.brownMedium.opacity(0.1),
                            radius: isSelected ? 8 : 4,
                            x: 0,
                            y: isSelected ? 4 : 2
                        )
                    
                    Text("🪑")
                        .font(.system(size: 28))
                        .opacity(isSelected ? 0.9 : 0.7)
                }
                

                Text("\(table.number)")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(isSelected ? .white : AppTheme.brownDark)
                

                Text("Table")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(isSelected ? .white.opacity(0.9) : AppTheme.brownMedium)
            }
            .frame(width: 90, height: 120)
            .padding(.vertical, 12)
            .padding(.horizontal, 8)
            .background(
                Group {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(
                                LinearGradient(
                                    colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .matchedGeometryEffect(id: "selectedTable", in: namespace)
                    } else {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(AppTheme.cardBackground)
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        isSelected ?
                        Color.white.opacity(0.3) :
                        AppTheme.brownMedium.opacity(0.2),
                        lineWidth: isSelected ? 2 : 1.5
                    )
            )
            .scaleEffect(scale)
            .shadow(
                color: isSelected ?
                AppTheme.brownDark.opacity(0.4) :
                AppTheme.brownDark.opacity(0.08),
                radius: isSelected ? 12 : 6,
                x: 0,
                y: isSelected ? 6 : 3
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView(viewModel: OrderViewModel())
}
