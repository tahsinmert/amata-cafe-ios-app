import SwiftUI
import AVFoundation

struct QRCodeScannerView: View {
    @ObservedObject var viewModel: OrderViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isScanning = false
    @State private var scannedCode: String?
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var cameraPermissionDenied = false
    
    var body: some View {
        NavigationView {
            ZStack {
                AppTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {

                    VStack(spacing: 16) {
                        Text("📱")
                            .font(.system(size: 60))
                        
                        Text("scan_qr_code".localized)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(AppTheme.brownDark)
                        
                        Text(LocalizationManager.shared.currentLanguage == .turkish ?
                             "Masa üzerindeki QR kodu tarayın" :
                             "Scan the QR code on your table")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(AppTheme.brownMedium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 40)
                    

                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.black)
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(
                                        LinearGradient(
                                            colors: [AppTheme.brownDark, AppTheme.brownMedium],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 3
                                    )
                            )
                            .shadow(color: AppTheme.brownDark.opacity(0.3), radius: 20, x: 0, y: 10)
                        
                        if !cameraPermissionDenied {
                            QRCodeScannerRepresentable(
                                onQRCodeScanned: { code in
                                    isScanning = false
                                    handleScannedCode(code)
                                },
                                onError: { error in
                                    isScanning = false
                                    errorMessage = error
                                    if error.contains("permission") {
                                        cameraPermissionDenied = true
                                    }
                                    showError = true
                                }
                            )
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .overlay(
                                ScannerCornerView()
                                    .frame(width: 300, height: 300)
                            )
                            
                            if !isScanning {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color.black.opacity(0.3))
                                    
                                    VStack(spacing: 12) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.white)
                                        
                                        Text(LocalizationManager.shared.currentLanguage == .turkish ? "QR Kod Tespit Edildi" : "QR Code Detected")
                                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                }
                                .frame(width: 300, height: 300)
                            }
                        } else {
                            VStack(spacing: 16) {
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(AppTheme.brownMedium)
                                
                                Text(LocalizationManager.shared.currentLanguage == .turkish ? "Kamera İzni Gerekli" : "Camera Permission Required")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .foregroundColor(AppTheme.brownDark)
                                
                                Text(LocalizationManager.shared.currentLanguage == .turkish ? 
                                     "QR kod tarayabilmek için kamera erişimine ihtiyacımız var." :
                                     "We need camera access to scan QR codes.")
                                    .font(.system(size: 14, design: .rounded))
                                    .foregroundColor(AppTheme.brownMedium)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                            }
                            .frame(width: 300, height: 300)
                            .background(AppTheme.cardBackground)
                        }
                    }
                    .padding(.vertical, 30)
                    
                    Spacer()
                    

                    Button(action: {

                        dismiss()
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "hand.tap")
                            Text(LocalizationManager.shared.currentLanguage == .turkish ? "Manuel Giriş" : "Manual Entry")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(AppTheme.brownDark)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 16)
                        .background(AppTheme.beigeMedium.opacity(0.3))
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(AppTheme.brownMedium.opacity(0.3), lineWidth: 2)
                        )
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle(LocalizationManager.shared.currentLanguage == .turkish ? "QR Kod" : "QR Code")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(AppTheme.brownMedium)
                    }
                }
            }
            .onAppear {
                isScanning = true
            }
            .alert(isPresented: $showError) {
                Alert(
                    title: Text(LocalizationManager.shared.currentLanguage == .turkish ? "Hata" : "Error"),
                    message: Text(errorMessage),
                    dismissButton: .default(Text(LocalizationManager.shared.currentLanguage == .turkish ? "Tamam" : "OK"))
                )
            }
        }
    }
    
    private func handleScannedCode(_ code: String) {
        isScanning = false
        
        viewModel.setTableFromQR(code: code)
        
        if viewModel.currentTable != nil {
            let impactFeedback = UINotificationFeedbackGenerator()
            impactFeedback.notificationOccurred(.success)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                dismiss()
            }
        } else {
            let impactFeedback = UINotificationFeedbackGenerator()
            impactFeedback.notificationOccurred(.error)
            
            errorMessage = LocalizationManager.shared.currentLanguage == .turkish ?
                "Geçersiz QR kod. Lütfen masa üzerindeki QR kodu tarayın." :
                "Invalid QR code. Please scan the QR code on your table."
            showError = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isScanning = true
            }
        }
    }
}

struct ScannerCornerView: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 20, y: 40))
                path.addLine(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 40, y: 20))
            }
            .stroke(Color.white, lineWidth: 4)
            .frame(width: 300, height: 300, alignment: .topLeading)
            
            Path { path in
                path.move(to: CGPoint(x: 280, y: 20))
                path.addLine(to: CGPoint(x: 280, y: 40))
                path.addLine(to: CGPoint(x: 260, y: 20))
            }
            .stroke(Color.white, lineWidth: 4)
            .frame(width: 300, height: 300, alignment: .topTrailing)
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: 260))
                path.addLine(to: CGPoint(x: 20, y: 280))
                path.addLine(to: CGPoint(x: 40, y: 280))
            }
            .stroke(Color.white, lineWidth: 4)
            .frame(width: 300, height: 300, alignment: .bottomLeading)
            
            Path { path in
                path.move(to: CGPoint(x: 280, y: 280))
                path.addLine(to: CGPoint(x: 280, y: 260))
                path.addLine(to: CGPoint(x: 260, y: 280))
            }
            .stroke(Color.white, lineWidth: 4)
            .frame(width: 300, height: 300, alignment: .bottomTrailing)
        }
    }
}

#Preview {
    QRCodeScannerView(viewModel: OrderViewModel())
}
