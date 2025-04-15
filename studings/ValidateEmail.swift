//
//  ValidateEmail.swift
//  studings
//
//  Created by Mateus on 14/04/25.
//

import SwiftUI

struct ValidateEmail: View {
	@State var email = ""
	@State var message = ""
	@State var messageSucess = ""
    var body: some View {
			TextField("Insira seu email:", text: $email)
				.keyboardType(.emailAddress)
				.padding(.leading)
				.padding(.bottom, 40)

			Button(action: {
				validateEmail()
			}, label: {
				Text("Verificar e-mail")
			})
			.padding(.bottom, 40)
			
			
			Text(message)
				.foregroundStyle(.red)
				.padding(.bottom,30)
			Text(messageSucess)
				.foregroundStyle(.green)
    }
	func validateEmail(){
		if email == ""{
			message = "O campo do email nao pode estar vazio"
		} else if !email.contains("@"){
			message = "Insira um email válido"
		} else {
			message = ""
			messageSucess = "Seu email foi verificado!"
		}
	}
}

#Preview {
    ValidateEmail()
}
