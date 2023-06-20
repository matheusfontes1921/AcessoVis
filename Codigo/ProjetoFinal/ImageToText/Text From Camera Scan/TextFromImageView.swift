import SwiftUI

struct TextFromImageView: View {
    @Environment(\.dismiss) var dismiss
    private let pastboard = UIPasteboard.general
    let imageToScan: UIImage
    @Binding var scannedText: String
    
    @State private var currentPastboard = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                LiveTextUIImageView(image: imageToScan)
                Text("Selecione e copie o texto ")
                    .foregroundColor(.black)
                Button("Traduzir") {
                    if let string = pastboard.string {
                        if !string.isEmpty {
                            scannedText = string
                        }
                    }
                    dismiss()
                }
                .padding(.bottom,10.0)
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Copiar Texto")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                pastboard.string = ""
            }
        }
    }
}

struct TextFromImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextFromImageView(imageToScan: UIImage(), scannedText: .constant(""))
    }
}
