//
//  LiveTextFromCameraScan.swift
//  TesteFinal
//
//  Created by Student18 on 09/05/23.
//

import SwiftUI

struct LiveTextFromCameraScan: View {
    @Environment(\.dismiss) var dismiss
    @Binding var liveScan: Bool
    @Binding var scannedText: String
    var body: some View {
        NavigationStack {
            VStack {
                DataScannerVC(scannedText: $scannedText, liveScan: $liveScan)
                Text("Capturar Texto")
                    .foregroundColor(.white)
                Button("Cancelar") {
                    dismiss()
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Capture Text")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LiveTextFromCameraScan_Previews: PreviewProvider {
    static var previews: some View {
        LiveTextFromCameraScan(liveScan: .constant(false), scannedText: .constant(""))
    }
}
