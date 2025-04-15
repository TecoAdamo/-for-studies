//
//  ForcePassword.swift
//  studings
//
//  Created by Mateus on 15/04/25.
//


import SwiftUI

struct PasswordStrength: View {
		@State var password = ""
		@State var passwordStrength = ""
		@State var messageIsEmpty = ""

		var body: some View {
				VStack(spacing: 20) {
						SecureField("Digite sua senha", text: $password)
								.textFieldStyle(.roundedBorder)
								.padding(.horizontal)

						Text("Força: \(passwordStrength)")
								.foregroundStyle(.blue)

						Button("Verificar força") {
								checkStrength()
						}
					Text(messageIsEmpty)
						.foregroundStyle(.red)
				}
				.padding()
		}

	func checkStrength() {
		if password == "" {
			messageIsEmpty = "Preencha o campo para verificar senha."
		} else if password.count < 4{
			passwordStrength = "Muito fraca"
			messageIsEmpty = ""
		} else if password.count < 4 && password.rangeOfCharacter(from: .decimalDigits) == nil {
			passwordStrength = "Fraca"
			messageIsEmpty = ""
		} else if password.count < 6 && password.rangeOfCharacter(from: .decimalDigits) != nil{
			passwordStrength = "Média"
			messageIsEmpty = ""
		} else if password.count < 8 && (password.rangeOfCharacter(from: .decimalDigits) != nil) && (password.rangeOfCharacter(from: .uppercaseLetters) != nil){
			passwordStrength = "Forte"
			messageIsEmpty = ""
		} else if password.count >=  10 && (password.rangeOfCharacter(from: .decimalDigits) != nil) && (password.rangeOfCharacter(from: .uppercaseLetters) != nil) && (password.rangeOfCharacter(from: CharacterSet(charactersIn: "!@#$%^&*")) != nil){
			passwordStrength = "Muito forte"
			messageIsEmpty = ""
		}
	
	}
		
}

#Preview {
		PasswordStrength()
}
