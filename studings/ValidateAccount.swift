//
//  ValidateAccount.swift
//  studings
//
//  Created by Mateus on 15/04/25.
//

import SwiftUI

struct ValidateAccount: View {
	
	@State var email = ""
	@State var password = ""
	@State var messageError = ""
	@State var messageSucess = ""
	
	var body: some View {
		VStack{
			Spacer()
			VStack{
				TextField("Digite seu e-mail:", text: $email)
					.textFieldStyle(.roundedBorder)
					.padding(.horizontal)
					.keyboardType(.emailAddress)
			}
			.padding(.bottom)
			VStack{
				SecureField("Digite sua senha:", text: $password)
					.textFieldStyle(.roundedBorder)
					.padding(.horizontal)
			}
			Text(messageError)
				.foregroundStyle(.red)
				.padding(.top,30)
			Text(messageSucess)
				.foregroundStyle(.green)
				.padding(.top,30)
			Spacer()
			Button(action: {
				validateInputs()
			}, label: {
				Text("Criar conta")
			})
			.padding(.bottom,40)
		}
	}
	func validateInputs(){
		if email.isEmpty || password.isEmpty{
			messageError = "Preencha os campos antes de prosseguir."
			messageSucess = ""
		} else if !email.contains("@") || !email.contains(".com"){
			messageError = "Informe um email válido."
			messageSucess = ""
		} else if password.count < 6{
			messageError = "Sua senha deve conter pelo menos 6 caracteres."
			messageSucess = ""
		} else if password.rangeOfCharacter(from: .decimalDigits)  ==  nil{
			messageError = "Sua senha deve conter pelo menos 1 número"
			messageSucess = ""
		} else if password.rangeOfCharacter(from: .uppercaseLetters) == nil{
			messageError = "Sua senha deve conter pelo menos 1 letra maiuscula"
			messageSucess = ""
		} else {
			messageError = ""
			messageSucess = "Sua conta foi criada"
		}
	}
}

#Preview {
    ValidateAccount()
}
