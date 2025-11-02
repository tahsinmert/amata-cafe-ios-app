import SwiftUI

struct SettingsView: View {
    @ObservedObject var localizationManager = LocalizationManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var selectedLanguage: AppLanguage
    
    init() {
        _selectedLanguage = State(initialValue: LocalizationManager.shared.currentLanguage)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {

                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Image(systemName: "globe")
                                    .font(.system(size: 24))
                                    .foregroundColor(AppTheme.brownDark)
                                
                                Text(LocalizationManager.shared.currentLanguage == .turkish ? "Dil" : "Language")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(AppTheme.brownDark)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 20)
                            
                            VStack(spacing: 12) {
                                ForEach(AppLanguage.allCases) { language in
                                    LanguageOptionRow(
                                        language: language,
                                        isSelected: selectedLanguage == language
                                    ) {
                                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                                        impactFeedback.impactOccurred()
                                        
                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                            selectedLanguage = language
                                            localizationManager.setLanguage(language)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                        .background(AppTheme.cardBackground)
                        .cornerRadius(24)
                        .shadow(
                            color: AppTheme.brownDark.opacity(0.08),
                            radius: 12,
                            x: 0,
                            y: 4
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    }
                }
            }
            .navigationTitle("Settings")
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

struct LanguageOptionRow: View {
    let language: AppLanguage
    let isSelected: Bool
    let action: () -> Void
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                scale = 0.98
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    scale = 1.0
                }
            }
            
            action()
        }) {
            HStack(spacing: 16) {

                ZStack {
                    Circle()
                        .fill(
                            isSelected ?
                            LinearGradient(
                                colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ) :
                            LinearGradient(
                                colors: [AppTheme.beigeLight, AppTheme.beigeMedium.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    Text(language == .turkish ? "🇹🇷" : "🇬🇧")
                        .font(.system(size: 24))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(language.displayName)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? AppTheme.brownDark : AppTheme.brownDark)
                    
                    Text(language.nativeName)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(isSelected ? AppTheme.brownMedium : AppTheme.brownMedium)
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(AppTheme.brownDark)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(18)
            .background(
                isSelected ?
                AppTheme.beigeLight.opacity(0.5) :
                Color.clear
            )
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        isSelected ?
                        AppTheme.brownMedium.opacity(0.3) :
                        AppTheme.brownMedium.opacity(0.1),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
            .scaleEffect(scale)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SettingsView()
}
