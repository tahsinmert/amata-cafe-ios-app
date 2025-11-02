import SwiftUI

struct OrderHistoryView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                if viewModel.orderHistory.isEmpty {
                    EmptyOrderHistoryView()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.orderHistory) { historyItem in
                                OrderHistoryCard(historyItem: historyItem)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                    }
                }
            }
            .navigationTitle("order_history".localized)
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

struct OrderHistoryCard: View {
    let historyItem: OrderHistoryItem
    
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: LocalizationManager.shared.currentLanguage == .turkish ? "tr_TR" : "en_US")
        return formatter.string(from: historyItem.date)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(LocalizationManager.shared.currentLanguage == .turkish ? "Masa \(historyItem.table.number)" : "Table \(historyItem.table.number)")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.brownDark)
                    
                    Text(formattedDate)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(AppTheme.brownMedium)
                }
                
                Spacer()
                
                Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", historyItem.totalPrice))
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(AppTheme.brownDark)
            }
            
            Divider()
                .background(AppTheme.brownMedium.opacity(0.2))
            

            VStack(spacing: 12) {
                ForEach(historyItem.items) { orderItem in
                    HStack {
                        Text(orderItem.menuItem.imageName)
                            .font(.system(size: 24))
                        
                        Text(orderItem.menuItem.name)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                        
                        Spacer()
                        
                        Text("\(orderItem.quantity)x")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(AppTheme.brownMedium)
                        
                        Text(String(format: LocalizationManager.shared.currentLanguage == .turkish ? "%.2f ₺" : "$%.2f", orderItem.totalPrice))
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                    }
                }
            }
            

            if !historyItem.notes.isEmpty {
                Divider()
                    .background(AppTheme.brownMedium.opacity(0.2))
                
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "note.text")
                        .font(.system(size: 14))
                        .foregroundColor(AppTheme.brownMedium)
                    
                    Text(historyItem.notes)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(AppTheme.brownMedium)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(20)
        .background(AppTheme.cardBackground)
        .cornerRadius(20)
        .shadow(color: AppTheme.brownDark.opacity(0.08), radius: 12, x: 0, y: 4)
    }
}

struct EmptyOrderHistoryView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("📋")
                .font(.system(size: 80))
            
            Text("no_order_history".localized)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(AppTheme.brownDark)
            
            Text("no_order_history_message".localized)
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(AppTheme.brownMedium)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
    }
}

#Preview {
    OrderHistoryView(viewModel: OrderViewModel())
}
