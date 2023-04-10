//
//  VoiceRecognizer.swift
//  Miau Little Helper
//
//  Created by Jpsmor on 27/03/23.
//

import Speech

class VoiceRecognizer : NSObject, SFSpeechRecognizerDelegate {

    //MARK: - variaveis pra fazer rolar
    let audioEngine = AVAudioEngine()
    let speechRecognizer : SFSpeechRecognizer? = SFSpeechRecognizer(locale: Locale.init(identifier: "pt-BR"))
    let request = SFSpeechAudioBufferRecognitionRequest()
    var task : SFSpeechRecognitionTask!
    var command = ""
    
    
    
    func requestPermission() {
        audioEngine.inputNode.removeTap(onBus: 0)
        SFSpeechRecognizer.requestAuthorization {  (authState) in
            OperationQueue.main.addOperation {
                if authState == .authorized {
                    print("The authorization was granted")
                    self.startSpeechRecognization()
                } else if authState == .denied {
                    print("The user denied the authorization")
                } else if authState == .notDetermined {
                    print ("The device does not support speech recognizer")
                } else if authState == .restricted {
                    print ("There is a restriction")
                }
            }
        }
    }
    
    func startSpeechRecognization() {
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch let error {
            print("There was an error when trying to start the audioEngine")
            print(error.localizedDescription)
        }
        
        
        guard let myRecognization = SFSpeechRecognizer() else {
            print("The localization does not support speech recognizer")
            return
        }
        
        if myRecognization.isAvailable {
            print ("Speech recognizer is available")
        }
        
        task = speechRecognizer?.recognitionTask(with: request, resultHandler: { (response, error) in
            guard let response = response else {
                if error != nil {
                    print (error.debugDescription)
                } else {
                    print ("There was an error in a task")
                }
                return
            }
            
            var message = response.bestTranscription.formattedString

            for segment in response.bestTranscription.segments {
                let indexTo = message.index(message.startIndex, offsetBy: segment.substringRange.location)
                self.command = String(message[indexTo...]).lowercased()
            }
            message = ""
            print(self.command)
        })
    }
    
    //MARK: - função de finalizar o reconhecimento de fala por hora em desuso.
//    func cancelSpeechRecognization() {
//        task.finish()
//        task.cancel()
//        task = nil
//
//        request.endAudio()
//        audioEngine.stop()
//        audioEngine.inputNode.removeTap(onBus: 0)
//    }

}
