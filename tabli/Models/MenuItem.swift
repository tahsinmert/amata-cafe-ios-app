import Foundation

enum MenuCategory: String, CaseIterable, Identifiable, Codable {
    case coffee = "Coffee"
    case pastries = "Pastries"
    case coldDrinks = "Cold Drinks"
    case snacks = "Snacks"
    case desserts = "Desserts"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .coffee: return "☕"
        case .pastries: return "🥐"
        case .coldDrinks: return "🧊"
        case .snacks: return "🥗"
        case .desserts: return "🍰"
        }
    }
    
    var localizedName: String {
        switch self {
        case .coffee: return "category_coffee".localized
        case .pastries: return "category_pastries".localized
        case .coldDrinks: return "category_cold_drinks".localized
        case .snacks: return "category_snacks".localized
        case .desserts: return "category_desserts".localized
        }
    }
}

struct MenuItem: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let price: Double
    let imageName: String
    let category: MenuCategory
    
    init(id: UUID = UUID(), name: String, description: String, price: Double, imageName: String, category: MenuCategory) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageName = imageName
        self.category = category
    }
}

struct OrderItem: Identifiable, Equatable, Codable {
    let id: UUID
    let menuItem: MenuItem
    var quantity: Int
    
    var totalPrice: Double {
        menuItem.price * Double(quantity)
    }
    
    init(menuItem: MenuItem, quantity: Int = 1) {
        self.id = UUID()
        self.menuItem = menuItem
        self.quantity = quantity
    }
}

struct Table: Identifiable, Equatable, Codable {
    let id: Int
    let number: Int
    
    static let availableTables: [Table] = (1...20).map { Table(id: $0, number: $0) }
}
