//
//  Tradutor.swift
//  ProjetoFinal
//
//  Created by Student23 on 25/04/23.
//

import SwiftUI
import PhotosUI
import VisionKit
import UIKit
import AVFoundation
import Foundation
import Speech

struct Tradutor: View {
    @State var imageData: Data = .init(capacity: 0)
    @State var show = false
    @State var imagepicker = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    @State var textTranslated: String = ""
    @State var dict = Dict()
    @StateObject var imagePicker = ImagePicker()
    @FocusState var focusState: Bool
    @State var liveScan = true
    let speechSynthesizer = AVSpeechSynthesizer()
    
    func closeSheet() {
            let utterance = AVSpeechUtterance(string: textTranslated)
            utterance.pitchMultiplier = 1.0
            utterance.rate = 0.5
            utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
            
            speechSynthesizer.speak(utterance)
    }
    
    var body: some View {
        ScrollView {

            VStack(spacing: 20 ) {
                TextEditor(text: $textTranslated)
                    .frame(height: 300)
                    .border(Color.gray)
                    .focused($focusState)
                
                Spacer()
                
                if DataScannerViewController.isSupported {
                    Button("Abrir camera") {
                        liveScan.toggle()
                        focusState = false
                    }
                    .frame(width: 360, height: 60.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .cornerRadius(10.0)
                } else {
                    Text("Does not support Live Text from camera scan.")
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        focusState = false
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down.fill")
                    }
                }
            }
            .navigationTitle("Live Text")
            .sheet(isPresented: $liveScan, onDismiss: closeSheet) {
                LiveTextFromCameraScan(liveScan: $liveScan, scannedText: $textTranslated)
            }
            
            .sheet(item: $imagePicker.imageToScan) { imageToScan in
                TextFromImageView(imageToScan: imageToScan.image, scannedText: $textTranslated)
            }
        }
        }
    
}

struct Tradutor_Previews: PreviewProvider {
    static var previews: some View {
        Tradutor()
    }
}
