//
//  TimerStart.swift
//  studings
//
//  Created by Mateus on 12/04/25.
//

import SwiftUI

struct TimerStart: View {
    @State private var timer: Timer? = nil
    @State private var timerIsRunning = false
    @State private var secondsElapsed = 0
    var body: some View {
        VStack{
            Text("Tempo: \(secondsElapsed) segundos")
            HStack(spacing: 90){
                Button(action: {
                    startTimer()
                }) {
                    Text("Iniciar")
                        .padding(8)
                        .border(Color.blue, width: 1)
                    
                }
                Button(action: {
                    stopTimer()
                }) {
                    Text("Parar")
                        .padding(8)
                        .border(Color.blue, width: 1)
                    
                }
                Button(action: {
                    scleanTimer()
                }) {
                    Text("Zerar")
                        .padding(8)
                        .border(Color.blue, width: 1)
                    
                }
            }
        }
    }
    func startTimer(){
        timerIsRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ _ in
        secondsElapsed += 1
        }
    }
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        timerIsRunning = false
        
    }
    func scleanTimer(){
        timer?.invalidate()
        timer = nil
        timerIsRunning = false
        secondsElapsed = 0
    }
}

#Preview {
    TimerStart()
}
