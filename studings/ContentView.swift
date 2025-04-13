//
//  ContentView.swift
//  studings
//
//  Created by Mateus on 10/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberCount =  0
    
    var body: some View {
        VStack {
            if numberCount == 10 {
                Text("Chegamos aos 10 primeiros números")
                    .foregroundStyle(.green)
            }
            
            Text("Número: \(numberCount)")
                
            HStack{
                Button(action: handleNumberCount, label: {
                    Text("Contar")
                    Image(systemName: "plus.app.fill")
                })
                .padding()
                Button(action: handleActuallyNumber, label: {
                    Text("Diminuir")
                    Image(systemName: "minus.rectangle.fill")
                })
            }
            .padding(.top,30)
        }
        .padding()
    }
    func handleNumberCount(){
        
        numberCount += 1
    }
    
    func handleActuallyNumber(){
        if numberCount > 0{
            numberCount -= 1
        }
    }
}

#Preview {
    ContentView()
}
