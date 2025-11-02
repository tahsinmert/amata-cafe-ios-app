import Foundation
import SwiftUI
import Combine

@MainActor
class UserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    init() {
        loadUserProfile()
    }
    
    func saveUserProfile() {
        guard let user = currentUser else { return }
        
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "userProfile")
        }
    }
    
    private func loadUserProfile() {
        guard let data = UserDefaults.standard.data(forKey: "userProfile"),
              let user = try? JSONDecoder().decode(User.self, from: data) else {
            currentUser = nil
            return
        }
        
        currentUser = user
    }
    
    func createProfile(name: String, email: String, phoneNumber: String) {
        currentUser = User(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            joinDate: Date()
        )
        saveUserProfile()
    }
    
    func updateProfile(name: String?, email: String?, phoneNumber: String?) {
        guard var user = currentUser else { return }
        
        if let name = name {
            user.name = name
        }
        if let email = email {
            user.email = email
        }
        if let phoneNumber = phoneNumber {
            user.phoneNumber = phoneNumber
        }
        
        currentUser = user
        saveUserProfile()
    }
    
    func updateProfileImage(imageData: Data?) {
        guard var user = currentUser else { return }
        user.profileImageData = imageData
        currentUser = user
        saveUserProfile()
    }
    
    func updatePreferences(_ preferences: UserPreferences) {
        guard var user = currentUser else { return }
        user.preferences = preferences
        currentUser = user
        saveUserProfile()
    }
    
    func hasProfile() -> Bool {
        return currentUser != nil
    }
}

