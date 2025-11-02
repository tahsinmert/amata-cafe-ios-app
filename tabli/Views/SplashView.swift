import SwiftUI

struct SplashView: View {
    @State private var logoScale: CGFloat = 0.8
    @State private var logoOpacity: Double = 0.3
    @State private var loadingOpacity: Double = 0
    @State private var loadingScale: CGFloat = 0.8
    @Binding var showHome: Bool
    
    var body: some View {
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Image("AmataLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                

                CoffeeLoadingView()
                    .opacity(loadingOpacity)
                    .scaleEffect(loadingScale)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {

            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }
            

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    loadingOpacity = 1.0
                    loadingScale = 1.0
                }
            }
            

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeOut(duration: 0.4)) {
                    logoOpacity = 0
                    loadingOpacity = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        showHome = false
                    }
                }
            }
        }
    }
}

struct CoffeeLoadingView: View {
    @State private var rotation: Double = 0
    @State private var pulseScale: CGFloat = 1.0
    @State private var dotScales: [CGFloat] = [1.0, 1.0, 1.0]
    
    var body: some View {
        VStack(spacing: 20) {

            ZStack {

                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(
                        LinearGradient(
                            colors: [
                                AppTheme.brownDark,
                                AppTheme.brownMedium,
                                AppTheme.beigeMedium.opacity(0.3)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 4, lineCap: .round)
                    )
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(rotation))
                

                Circle()
                    .trim(from: 0, to: 0.6)
                    .stroke(
                        LinearGradient(
                            colors: [
                                AppTheme.brownMedium,
                                AppTheme.beigeMedium,
                                AppTheme.beigeLight.opacity(0.3)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 3, lineCap: .round)
                    )
                    .frame(width: 35, height: 35)
                    .rotationEffect(.degrees(-rotation))
                

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                AppTheme.brownDark,
                                AppTheme.brownMedium.opacity(0.5)
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 6
                        )
                    )
                    .frame(width: 12, height: 12)
                    .scaleEffect(pulseScale)
            }
            

            HStack(spacing: 8) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    AppTheme.brownDark,
                                    AppTheme.brownMedium
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 8, height: 8)
                        .scaleEffect(dotScales[index])
                }
            }
        }
        .onAppear {

            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            

            withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                pulseScale = 1.3
            }
            

            for index in 0..<3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
                    withAnimation(
                        .easeInOut(duration: 0.6)
                        .repeatForever(autoreverses: true)
                    ) {
                        dotScales[index] = 1.3
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView(showHome: .constant(false))
}
