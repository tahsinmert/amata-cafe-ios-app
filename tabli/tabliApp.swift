import SwiftUI

@main
struct tabliApp: App {
    @StateObject private var localizationManager: LocalizationManager
    
    init() {
        let manager = LocalizationManager.shared
        _localizationManager = StateObject(wrappedValue: manager)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localizationManager)
        }
    }
}
