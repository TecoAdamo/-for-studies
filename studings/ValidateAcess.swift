//
//  ValidateAcess.swift
//  studings
//
//  Created by Mateus on 14/04/25.
//

import SwiftUI

struct ValidateAcess: View {
	
	@State var email = ""
	@State var password = ""
	@State var messageError = ""
	@State var messageSucess = ""
	
    var body: some View {
			VStack {
				HStack{
					TextField("Informe seu email: ", text: $email)
						.padding(.leading)
						.keyboardType(.emailAddress)
					
						//Image(systemName: "person")
				}
				.padding(.bottom)
				
				HStack{
					SecureField("Informe sua senha: ", text: $password)
						.padding(.leading)
					//Image(systemName: "eye")
				}
				Button(action: {
					validateAcess()
				}, label: {
					Text("Criar conta")
				})
				.padding(.top, 30)
				
				Text(messageError)
					.foregroundStyle(.red)
				
				Text(messageSucess)
					.foregroundStyle(.green)
			}
    }
	func validateAcess(){
		if email.isEmpty || password.isEmpty{
			messageError = "Preencha os campos para cadastrar."
		} else if !email.contains("@") || !email.contains(".com"){
			messageError = "Insira um email válido."
		} else if password.rangeOfCharacter(from: .decimalDigits) == nil {
			messageError = "Sua senha deve conter pelo menos 1 número."
		} else if password.count < 6{
			messageError = "Sua senhs deve conter pelo menos 6 caracteres"
		} else {
			messageError = ""
			messageSucess = "Seu cadastro foi realizado."
			email = ""
			password = ""
		}
	}
}

#Preview {
    ValidateAcess()
}

// Campo de e-mail ✅
// Campo de senha 🔒
// Botão “Criar conta”
// Textos de erro em vermelho
