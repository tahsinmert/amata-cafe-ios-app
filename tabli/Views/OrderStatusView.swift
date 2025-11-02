import SwiftUI

struct OrderStatusView: View {
    @ObservedObject var viewModel: OrderViewModel
    @ObservedObject var localizationManager = LocalizationManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var progress: Double = 0.0
    @State private var showOrderDetails = false
    @State private var showEditOrder = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Spacer()
                    

                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [
                                        AppTheme.brownDark.opacity(0.2),
                                        AppTheme.brownDark.opacity(0.05)
                                    ],
                                    center: .center,
                                    startRadius: 20,
                                    endRadius: 100
                                )
                            )
                            .frame(width: 200, height: 200)
                        
                        Group {
                            switch viewModel.orderStatus {
                            case .pending:
                                Image(systemName: "clock.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.brownMedium)
                            case .preparing:
                                Image(systemName: "timer")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.brownDark)
                            case .ready:
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.brownDark)
                            case .none:
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(AppTheme.brownDark)
                            }
                        }
                    }
                    

                    VStack(spacing: 12) {
                        Text(statusTitle)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                        
                        Text(statusMessage)
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(AppTheme.brownMedium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    

                    if viewModel.orderStatus != .none && viewModel.orderStatus != .ready {
                        VStack(spacing: 12) {
                            ProgressView(value: progress, total: 1.0)
                                .progressViewStyle(LinearProgressViewStyle(tint: AppTheme.brownDark))
                                .frame(height: 8)
                                .cornerRadius(4)
                                .padding(.horizontal, 40)
                            
                            Text("\(Int(progress * 100))%")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                        }
                    }
                    
                    Spacer()
                    

                    if !viewModel.orderItems.isEmpty {
                        VStack(spacing: 16) {

                            VStack(spacing: 12) {
                                HStack {
                                    Text(localizationManager.currentLanguage == .turkish ? "Sipariş Özeti" : "Order Summary")
                                        .font(.system(size: 18, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                    
                                    Spacer()
                                    
                                    Text("\(viewModel.itemCount) \(viewModel.itemCount == 1 ? "item".localized : "items".localized)")
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .foregroundColor(AppTheme.brownMedium)
                                }
                                
                                Divider()
                                    .background(AppTheme.brownMedium.opacity(0.2))
                                

                                HStack {
                                    Text("total".localized)
                                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                    
                                    Spacer()
                                    
                                    Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", viewModel.totalPrice))
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .foregroundColor(AppTheme.brownDark)
                                }
                            }
                            .padding(20)
                            .background(AppTheme.cardBackground)
                            .cornerRadius(20)
                            .shadow(color: AppTheme.brownDark.opacity(0.08), radius: 10, x: 0, y: 4)
                            .padding(.horizontal, 20)
                            

                            HStack(spacing: 16) {

                                Button(action: {
                                    showOrderDetails = true
                                }) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "list.bullet")
                                            .font(.system(size: 16))
                                        Text(LocalizationManager.shared.currentLanguage == .turkish ? "Detaylar" : "View Details")
                                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                                    }
                                    .foregroundColor(AppTheme.brownDark)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(AppTheme.beigeMedium.opacity(0.3))
                                    .cornerRadius(20)
                                }
                                

                                if viewModel.orderStatus == .pending {
                                    Button(action: {
                                        showEditOrder = true
                                    }) {
                                        HStack(spacing: 8) {
                                            Image(systemName: "pencil")
                                                .font(.system(size: 16))
                                            Text(LocalizationManager.shared.currentLanguage == .turkish ? "Düzenle" : "Edit Order")
                                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                        }
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 14)
                                        .background(
                                            LinearGradient(
                                                colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .cornerRadius(20)
                                        .shadow(color: AppTheme.brownDark.opacity(0.3), radius: 8, x: 0, y: 4)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    

                    if let table = viewModel.currentTable {
                        VStack(spacing: 8) {
                            Text("table".localized)
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(AppTheme.brownMedium)
                            
                            Text("\(table.number)")
                                .font(.system(size: 48, weight: .bold, design: .rounded))
                                .foregroundColor(AppTheme.brownDark)
                        }
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationTitle("order_status_title".localized)
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
                updateProgress()
            }
            .onChange(of: viewModel.orderStatus) { _ in
                updateProgress()
            }
            .sheet(isPresented: $showOrderDetails) {
                OrderDetailsView(viewModel: viewModel)
            }
            .fullScreenCover(isPresented: $showEditOrder) {
                EditOrderView(viewModel: viewModel)
            }
        }
    }
    
    private var statusTitle: String {
        switch viewModel.orderStatus {
        case .pending:
            return "order_pending".localized
        case .preparing:
            return "preparing".localized
        case .ready:
            return "order_ready".localized
        case .none:
            return "no_active_order".localized
        }
    }
    
    private var statusMessage: String {
        switch viewModel.orderStatus {
        case .pending:
            return "order_pending_message".localized
        case .preparing:
            return "preparing_message".localized
        case .ready:
            return "order_ready_message".localized
        case .none:
            return "no_order_message".localized
        }
    }
    
    private func updateProgress() {
        withAnimation(.easeInOut(duration: 1.0)) {
            switch viewModel.orderStatus {
            case .pending:
                progress = 0.3
            case .preparing:
                progress = 0.7
            case .ready:
                progress = 1.0
            case .none:
                progress = 0.0
            }
        }
    }
}

#Preview {
    OrderStatusView(viewModel: OrderViewModel())
}
