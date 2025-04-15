//
//  PasswordGame.swift
//  studings
//
//  Created by Mateus on 15/04/25.
//

import SwiftUI

struct PasswordGame: View {
	@State var attemps = 3
	@State var passwordTextField = ""
	@State var messageError = ""
	@State var messageSucess = ""
	@State var messageReturn = ""
	@State var countdown = 10
	
	@State private var timer: Timer? = nil
	@State private var timerIsRun = false
	
    var body: some View {
			VStack{
				TextField("Digite uma senha", text: $passwordTextField)
					.textFieldStyle(.roundedBorder)
					.padding(.horizontal)
				
				
				Button(action: {
					attempsChance()
				}, label: {
					Text("Resultado")
				})
				.padding(.top,40)
				.disabled(attemps == 0 || timerIsRun)
				
				Text(messageError)
					.padding(.top,40)
					.foregroundStyle(.red)
				
				Text(messageReturn)
					.padding(.top,40)
					.foregroundStyle(.orange)
				
				Text(messageSucess)
					.padding(.top,40)
					.foregroundStyle(.green)
			}
    }
	
	func attempsChance(){
		guard timerIsRun == false else { return }

			if passwordTextField != "Swift123" {
					if attemps > 0 {
							attemps -= 1
							messageError = "Senha incorreta, vc ainda tem \(attemps) tentativas."
							messageSucess = ""
					}

					if attemps <= 0 {
							messageError = ""
							timerIsRun = true
							countdown = 10 
							timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
									if countdown > 0 {
											countdown -= 1
											messageReturn = "Tente novamente em \(countdown) segundos."
									} else {
											timer?.invalidate()
											timerIsRun = false
											messageReturn = "O tempo foi esgotado"
											DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
													resetGame()
											}
									}
							}
					}
			} else {
					messageSucess = "Você acertou, parabéns!"
					messageError = ""
			}
	}

	
	func resetGame(){
		attemps = 3
		countdown = 10
		passwordTextField = ""
		messageReturn = ""
		messageError =  ""
		timerIsRun = false
	}
}

#Preview {
    PasswordGame()
}
