//
//  Countdown.swift
//  studings
//
//  Created by Mateus on 12/04/25.
//

import SwiftUI

struct Countdown: View {
    @State private var timer: Timer? = nil
    @State private var timerIsRun = false
    @State private var countTimer = 10
    
    @State private var alertMessage = ""
    
    
    var body: some View {
        VStack{
            Text("Contagem regressiva: \(countTimer) segundos.")
            HStack{
                Button(action:  {
                    startCountdown()
                }) {
                    Text("Iniciar contagem regressiva")
                        .padding()
                        .border(Color.blue, width: 1)
                }
                
                Button(action:  {
                
                }) {
                    Text("Parar contagem regressiva")
                        .padding()
                        .border(Color.blue, width: 1)
                }
            }
            Text(alertMessage)
        }
    }
    func startCountdown(){
        timerIsRun = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){_ in
            if countTimer > 0 {
                countTimer -= 1
                
                if countTimer == 5 {
                    alertMessage = "⏳ O tempo está acabando!"
                }
            } else {
                timer?.invalidate()
                alertMessage = "O tempo foi esgotado"
            }
        }
    }
}

#Preview {
    Countdown()
}
