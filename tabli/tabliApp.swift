import SwiftUI

@main
struct tabliApp: App {
    @StateObject private var localizationManager: LocalizationManager
    @StateObject private var profileViewModel = UserProfileViewModel()
    
    init() {
        let manager = LocalizationManager.shared
        _localizationManager = StateObject(wrappedValue: manager)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localizationManager)
                .environmentObject(profileViewModel)
        }
    }
}
