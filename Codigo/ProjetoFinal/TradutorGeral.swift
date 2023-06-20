//  TradutorGeral.swift
//  ProjetoFinal
//
//  Created by Student23 on 26/04/23.
//

import SwiftUI
import PhotosUI
import VisionKit
import UIKit
import AVFoundation
import Foundation
import Speech

extension SFSpeechRecognizer {
    static func hasAuthorizationToRecognize() async -> Bool {
        await withCheckedContinuation { continuation in
            requestAuthorization { status in
                continuation.resume(returning: status == .authorized)
            }
        }
    }
}

extension AVAudioSession {
    func hasPermissionToRecord() async -> Bool {
        await withCheckedContinuation { continuation in
            requestRecordPermission { authorized in
                continuation.resume(returning: authorized)
            }
        }
    }
}


struct ArrayAuxiliary: Hashable {
    
    let id = UUID()
    let string: String
    
    static func makeStringArrayWithId(string: String) -> [ArrayAuxiliary] {
        var auxArray = [ArrayAuxiliary]()
        for char in string {
            let aux = ArrayAuxiliary(string: String(char))
            auxArray.append(aux)
        }
        return auxArray
    }
}

struct TradutorGeral: View {
    @State var imageData: Data = .init(capacity: 0)
    @State var show = false
    @State var imagepicker = false
    @State var source: UIImagePickerController.SourceType = .photoLibrary
    @State var textTranslated: String = ""
    @State private var dict = Dict()
    @StateObject var imagePicker = ImagePicker()
    @FocusState var focusState: Bool
    @State var liveScan = false
    
    // Parte do microfone
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    func closeSheet() {
        imagepicker.toggle()
    }
    
    var body: some View {
        let columnLayout = Array(repeating:  GridItem() , count: 5)
        NavigationView{
            ZStack{
                VStack{
                    Text("Tradutor")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                    
                        TextField("Digite o seu texto aqui", text: $textTranslated)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 340.0)
                            .multilineTextAlignment(.center)
                            .background(Color.blue.opacity(0.4).cornerRadius(10))
                            
                            .font(.title)
                    
                    
                    if imageData.count != 0 {
                        Image(uiImage: UIImage(data: self.imageData)!)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 250, height: 250)
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                            .foregroundColor(Color.purple)
                        
                        
                    }
                    Text(" ")
                    HStack{
                        Button(action: {
                            if !isRecording {
                                speechRecognizer.transcribe()

                            } else {
                                speechRecognizer.stopTranscribing()
                                self.textTranslated = speechRecognizer.transcript

                            }

                            isRecording.toggle()
                        }) {
                            VStack{
                                Image(systemName: "mic")
                                    .tint(.black)
                                    .font(.title)
                                if isRecording{
                                    Text("Gravando")
                                }

                            }

                        }
                        .foregroundColor(.blue)
                        
                        Button (action: {
                            imagepicker.toggle()
                        }){ label: do {
                            Image(systemName: "camera")
                                .font(.title)
                            
                        }
                        }
                        .foregroundColor(.blue)
                        .sheet(isPresented: $imagepicker) {
                                VStack(spacing: 20 ) {
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
                                        .padding(.horizontal)
                                        
                                    } else {
                                        Text("Does not support Live Text from camera scan.")
                                    }
                                    if ImageAnalyzer.isSupported {
                                        PhotosPicker(selection: $imagePicker.imageSelection, matching: .images, photoLibrary: .shared()) {
                                            Text("Selecionar imagem")
                                         

                                        }
                                        .frame(width: 360, height: 60.0)
                                        .background(.blue)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                        .cornerRadius(10.0)
                                        .padding(.horizontal)
                                        
                                    } else {
                                        Text("Does not support Live Text scanning from image.")
                                    }
                                    Spacer()
                                }
                                .presentationDetents([.height(250)])
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
                                .sheet(item: $imagePicker.imageToScan, onDismiss: closeSheet) { imageToScan in
                                    TextFromImageView(imageToScan: imageToScan.image, scannedText: $textTranslated)
                                }
                        }
                    }
                        .padding(.bottom, 25.0)
                        
                        
                        if(textTranslated != "") {
                            
                            ScrollView{
                                LazyVGrid(columns: columnLayout){
                                    ForEach(ArrayAuxiliary.makeStringArrayWithId(string: textTranslated), id: \.self){ a in
                                        TableBraille(letra: "\(a.string)")
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
        
        }
        
    }

struct TradutorGeral_Previews: PreviewProvider
{
    static var previews: some View
    {
        TradutorGeral()
    }
    
}
