import SwiftUI

struct OrderConfirmationView: View {
    @ObservedObject var viewModel: OrderViewModel
    @ObservedObject var localizationManager = LocalizationManager.shared
    @Environment(\.dismiss) var dismiss
    var onComplete: (() -> Void)?
    @State private var checkmarkScale: CGFloat = 0
    @State private var checkmarkOpacity: Double = 0
    @State private var confettiEnabled = true
    @State private var messageOpacity: Double = 0
    
    init(viewModel: OrderViewModel, onComplete: (() -> Void)? = nil) {
        self.viewModel = viewModel
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            

            if confettiEnabled {
                ConfettiView()
                    .opacity(confettiEnabled ? 1 : 0)
            }
            
            VStack(spacing: 40) {
                Spacer()
                

                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    AppTheme.brownDark.opacity(0.3),
                                    AppTheme.brownDark.opacity(0.1)
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: 100
                            )
                        )
                        .frame(width: 200, height: 200)
                        .scaleEffect(checkmarkScale * 1.2)
                        .opacity(checkmarkOpacity * 0.5)
                    
                    Circle()
                        .fill(AppTheme.beigeMedium)
                        .frame(width: 120, height: 120)
                        .shadow(color: AppTheme.brownDark.opacity(0.3), radius: 20, x: 0, y: 10)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(AppTheme.brownDark)
                        .scaleEffect(checkmarkScale)
                        .opacity(checkmarkOpacity)
                }
                

                VStack(spacing: 16) {
                    Text("order_placed".localized)
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(AppTheme.brownDark)
                        .opacity(messageOpacity)
                    
                    Text("order_sent_message".localized)
                        .font(.system(size: 18, design: .rounded))
                        .foregroundColor(AppTheme.brownMedium)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .opacity(messageOpacity)
                }
                .opacity(messageOpacity)
                
                Spacer()
                

                VStack(spacing: 16) {

                    Button(action: {
                        dismiss()
                        onComplete?()
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "list.bullet")
                            Text(LocalizationManager.shared.currentLanguage == .turkish ? "Siparişi Görüntüle" : "View Order")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(AppTheme.brownDark)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .background(AppTheme.beigeMedium.opacity(0.3))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(AppTheme.brownMedium.opacity(0.5), lineWidth: 2)
                        )
                    }
                    .opacity(messageOpacity)
                    

                    Button(action: {
                        viewModel.clearCart()
                        dismiss()
                        onComplete?()
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "house.fill")
                            Text("back_to_home".localized)
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(25)
                        .shadow(color: AppTheme.brownDark.opacity(0.3), radius: 15, x: 0, y: 8)
                    }
                    .opacity(messageOpacity)
                }
                .padding(.bottom, 60)
            }
        }
        .onAppear {

            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                checkmarkScale = 1.0
                checkmarkOpacity = 1.0
            }
            

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeIn(duration: 0.5)) {
                    messageOpacity = 1.0
                }
            }
            

            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    confettiEnabled = false
                }
            }
            

            let successFeedback = UINotificationFeedbackGenerator()
            successFeedback.notificationOccurred(.success)
        }
    }
}

struct ConfettiView: View {
    @State private var particles: [ConfettiParticle] = []
    
    struct ConfettiParticle: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var color: Color
        var rotation: Double
        var velocity: CGSize
    }
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: 8, height: 8)
                    .position(x: particle.x, y: particle.y)
                    .rotationEffect(.degrees(particle.rotation))
            }
        }
        .onAppear {
            createParticles()
            animateParticles()
        }
    }
    
    private func createParticles() {
        let colors: [Color] = [
            AppTheme.brownDark,
            AppTheme.brownMedium,
            AppTheme.beigeMedium,
            AppTheme.beigeLight
        ]
        
        particles = (0..<50).map { _ in
            ConfettiParticle(
                x: UIScreen.main.bounds.width / 2,
                y: UIScreen.main.bounds.height / 2,
                color: colors.randomElement() ?? AppTheme.brownDark,
                rotation: Double.random(in: 0...360),
                velocity: CGSize(
                    width: CGFloat.random(in: -200...200),
                    height: CGFloat.random(in: (-300)...(-100))
                )
            )
        }
    }
    
    private func animateParticles() {
        withAnimation(.easeOut(duration: 2.0)) {
            for i in particles.indices {
                particles[i].x += particles[i].velocity.width
                particles[i].y += particles[i].velocity.height
                particles[i].rotation += Double.random(in: 180...540)
            }
        }
    }
}

#Preview {
    OrderConfirmationView(viewModel: OrderViewModel())
}
