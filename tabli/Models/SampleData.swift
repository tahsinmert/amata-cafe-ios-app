import Foundation

extension MenuItem {
    static let sampleMenu: [MenuItem] = [

        MenuItem(name: "Espresso", description: "Rich and bold Italian classic", price: 3.50, imageName: "☕", category: .coffee),
        MenuItem(name: "Cappuccino", description: "Perfectly balanced espresso with steamed milk", price: 4.50, imageName: "☕", category: .coffee),
        MenuItem(name: "Latte", description: "Smooth espresso with velvety milk foam", price: 5.00, imageName: "☕", category: .coffee),
        MenuItem(name: "Americano", description: "Espresso with hot water", price: 3.75, imageName: "☕", category: .coffee),
        MenuItem(name: "Flat White", description: "Double shot with microfoam", price: 5.25, imageName: "☕", category: .coffee),
        MenuItem(name: "Mocha", description: "Chocolate meets coffee perfection", price: 5.50, imageName: "☕", category: .coffee),
        

        MenuItem(name: "Croissant", description: "Buttery, flaky French classic", price: 4.00, imageName: "🥐", category: .pastries),
        MenuItem(name: "Pain au Chocolat", description: "Chocolate-filled delight", price: 4.50, imageName: "🥐", category: .pastries),
        MenuItem(name: "Almond Danish", description: "Sweet almond paste in pastry", price: 5.00, imageName: "🥐", category: .pastries),
        MenuItem(name: "Cinnamon Roll", description: "Warm and gooey cinnamon swirl", price: 4.75, imageName: "🥐", category: .pastries),
        

        MenuItem(name: "Iced Coffee", description: "Chilled coffee perfection", price: 4.50, imageName: "🧊", category: .coldDrinks),
        MenuItem(name: "Cold Brew", description: "Smooth 24-hour steeped coffee", price: 5.00, imageName: "🧊", category: .coldDrinks),
        MenuItem(name: "Iced Latte", description: "Espresso over ice with milk", price: 5.25, imageName: "🧊", category: .coldDrinks),
        MenuItem(name: "Frappé", description: "Blended ice coffee delight", price: 5.75, imageName: "🧊", category: .coldDrinks),
        MenuItem(name: "Lemonade", description: "Fresh and zesty", price: 3.50, imageName: "🧊", category: .coldDrinks),
        

        MenuItem(name: "Avocado Toast", description: "Smashed avocado on sourdough", price: 8.50, imageName: "🥗", category: .snacks),
        MenuItem(name: "Caesar Salad", description: "Crisp romaine with classic dressing", price: 9.00, imageName: "🥗", category: .snacks),
        MenuItem(name: "Quiche Lorraine", description: "Bacon and cheese in flaky crust", price: 7.50, imageName: "🥗", category: .snacks),
        MenuItem(name: "Turkey Sandwich", description: "Fresh turkey with vegetables", price: 8.00, imageName: "🥗", category: .snacks),
        

        MenuItem(name: "Tiramisu", description: "Coffee-soaked Italian classic", price: 6.50, imageName: "🍰", category: .desserts),
        MenuItem(name: "Chocolate Cake", description: "Rich and decadent", price: 6.00, imageName: "🍰", category: .desserts),
        MenuItem(name: "Cheesecake", description: "Creamy New York style", price: 6.75, imageName: "🍰", category: .desserts),
        MenuItem(name: "Apple Pie", description: "Warm cinnamon-spiced", price: 5.50, imageName: "🍰", category: .desserts),
        MenuItem(name: "Brownie", description: "Fudgy chocolate perfection", price: 5.00, imageName: "🍰", category: .desserts)
    ]
}
