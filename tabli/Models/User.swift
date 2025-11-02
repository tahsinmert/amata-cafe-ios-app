import Foundation

struct User: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var email: String
    var phoneNumber: String
    var profileImageData: Data?
    var joinDate: Date
    var preferences: UserPreferences
    
    init(
        id: UUID = UUID(),
        name: String = "",
        email: String = "",
        phoneNumber: String = "",
        profileImageData: Data? = nil,
        joinDate: Date = Date(),
        preferences: UserPreferences = UserPreferences()
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.profileImageData = profileImageData
        self.joinDate = joinDate
        self.preferences = preferences
    }
}

struct UserPreferences: Codable, Equatable {
    var favoriteCategories: [MenuCategory]
    var dietaryRestrictions: [String]
    var preferredLanguage: AppLanguage
    var notificationsEnabled: Bool
    var darkModeEnabled: Bool
    
    init(
        favoriteCategories: [MenuCategory] = [],
        dietaryRestrictions: [String] = [],
        preferredLanguage: AppLanguage = .turkish,
        notificationsEnabled: Bool = true,
        darkModeEnabled: Bool = false
    ) {
        self.favoriteCategories = favoriteCategories
        self.dietaryRestrictions = dietaryRestrictions
        self.preferredLanguage = preferredLanguage
        self.notificationsEnabled = notificationsEnabled
        self.darkModeEnabled = darkModeEnabled
    }
}

