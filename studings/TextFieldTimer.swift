//
//  TextFieldTimer.swift
//  studings
//
//  Created by Mateus on 12/04/25.
//

import SwiftUI

struct TextFieldTimer: View {
    @State var IntFromString = 0
    @State private var StringFromIntOfTextField = ""
    //
    @State private var timer: Timer? = nil
    @State private var timerRunning = false
    //
    @State private var alertMessage = ""
    var body: some View {
        VStack{
            VStack{
                TextField("",text: $StringFromIntOfTextField, prompt: Text("Informe um número para contagem:"))
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .keyboardType(.numberPad)
            
                
                Text("Contagem: \(IntFromString)")
                Button(action: {
                    InitCountDown()
                })
                {
                    Text("Iniciar")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                Text(alertMessage)
                    .foregroundStyle(.red)
                }
            }
        .padding()
        }
    func InitCountDown(){
        if let time = Int(StringFromIntOfTextField){
            IntFromString = time
            timerRunning = true
            StringFromIntOfTextField = ""
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
                if IntFromString > 0 {
                    IntFromString -= 1
                    if IntFromString == 5{
                        alertMessage = "O tempo está acabando"
                    }
                } else {
                    timer?.invalidate()
                    timerRunning = false
                    alertMessage = "Seu tempo chegou ao fim."
                    
                }
                
        }
    }
        
    }
    
    }
#Preview {
    TextFieldTimer()
}
