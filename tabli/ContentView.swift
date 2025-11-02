import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = OrderViewModel()
    @State private var showSplash = true
    
    var body: some View {
        ZStack {

            AppTheme.background
                .ignoresSafeArea()
            

            if showSplash {
                SplashView(showHome: $showSplash)
            } else {
                HomeView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
