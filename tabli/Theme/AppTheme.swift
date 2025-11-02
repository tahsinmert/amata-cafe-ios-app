import SwiftUI

struct AppTheme {

    static let beigeLight = Color(hex: "EDE0D4")
    static let beigeMedium = Color(hex: "DDB892")
    static let brownMedium = Color(hex: "B08968")
    static let brownDark = Color(hex: "7F5539")
    static let ivory = Color(hex: "F5F1EB")
    static let cream = Color(hex: "F9F6F2")
    

    static let accent = brownDark
    static let background = cream
    static let cardBackground = ivory
    static let textPrimary = brownDark
    static let textSecondary = brownMedium
    

    static let fontName = "SF Rounded"
    

    static let animationDuration: Double = 0.3
    static let springAnimation = Animation.spring(response: 0.4, dampingFraction: 0.7)
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
