import Foundation
import SwiftUI
import Combine

@MainActor
class OrderViewModel: ObservableObject {
    @Published var orderItems: [OrderItem] = []
    @Published var currentTable: Table?
    @Published var orderStatus: OrderStatus = .none
    @Published var menuItems: [MenuItem] = MenuItem.sampleMenu
    @Published var favoriteItems: [MenuItem] = []
    @Published var orderHistory: [OrderHistoryItem] = []
    @Published var specialNotes: String = ""
    
    var totalPrice: Double {
        orderItems.reduce(0) { $0 + $1.totalPrice }
    }
    
    var itemCount: Int {
        orderItems.reduce(0) { $0 + $1.quantity }
    }
    
    func addItem(_ menuItem: MenuItem) {
        if let existingIndex = orderItems.firstIndex(where: { $0.menuItem.id == menuItem.id }) {
            orderItems[existingIndex].quantity += 1
        } else {
            orderItems.append(OrderItem(menuItem: menuItem, quantity: 1))
        }
    }
    
    func removeItem(_ orderItem: OrderItem) {
        if let index = orderItems.firstIndex(where: { $0.id == orderItem.id }) {
            if orderItems[index].quantity > 1 {
                orderItems[index].quantity -= 1
            } else {
                orderItems.remove(at: index)
            }
        }
    }
    
    func deleteItem(_ orderItem: OrderItem) {
        orderItems.removeAll { $0.id == orderItem.id }
    }
    
    func clearCart() {
        orderItems.removeAll()
    }
    
    func placeOrder() {
        guard !orderItems.isEmpty, currentTable != nil else { return }
        orderStatus = .pending
        

        addToHistory()
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.orderStatus = .preparing
        }
    }
    
    func getMenuItems(for category: MenuCategory) -> [MenuItem] {
        menuItems.filter { $0.category == category }
    }
    

    func toggleFavorite(_ menuItem: MenuItem) {
        if favoriteItems.contains(where: { $0.id == menuItem.id }) {
            favoriteItems.removeAll { $0.id == menuItem.id }
        } else {
            favoriteItems.append(menuItem)
        }
        saveFavorites()
    }
    
    func isFavorite(_ menuItem: MenuItem) -> Bool {
        favoriteItems.contains(where: { $0.id == menuItem.id })
    }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteItems.map { $0.id.uuidString }) {
            UserDefaults.standard.set(encoded, forKey: "favoriteItems")
        }
    }
    
    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: "favoriteItems"),
              let favoriteIds = try? JSONDecoder().decode([String].self, from: data) else { return }
        
        favoriteItems = menuItems.filter { item in
            favoriteIds.contains(item.id.uuidString)
        }
    }
    

    func addToHistory() {
        guard !orderItems.isEmpty, let table = currentTable else { return }
        
        let historyItem = OrderHistoryItem(
            id: UUID(),
            items: orderItems,
            table: table,
            totalPrice: totalPrice,
            date: Date(),
            notes: specialNotes
        )
        
        orderHistory.insert(historyItem, at: 0)
        saveOrderHistory()
        

        specialNotes = ""
    }
    
    private func saveOrderHistory() {
        if let encoded = try? JSONEncoder().encode(orderHistory) {
            UserDefaults.standard.set(encoded, forKey: "orderHistory")
        }
    }
    
    private func loadOrderHistory() {
        guard let data = UserDefaults.standard.data(forKey: "orderHistory"),
              let history = try? JSONDecoder().decode([OrderHistoryItem].self, from: data) else { return }
        
        orderHistory = history
    }
    

    func setTableFromQR(code: String) {

        let tableNumber = code
            .replacingOccurrences(of: "table-", with: "", options: .caseInsensitive)
            .trimmingCharacters(in: .whitespaces)
        
        if let number = Int(tableNumber),
           let table = Table.availableTables.first(where: { $0.number == number }) {
            currentTable = table
        }
    }
    
    init() {
        loadFavorites()
        loadOrderHistory()
    }
}

struct OrderHistoryItem: Identifiable, Codable {
    let id: UUID
    let items: [OrderItem]
    let table: Table
    let totalPrice: Double
    let date: Date
    let notes: String
}

enum OrderStatus {
    case none
    case pending
    case preparing
    case ready
}
