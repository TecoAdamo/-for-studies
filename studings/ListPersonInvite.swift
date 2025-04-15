//
//  ListPersonInvite.swift
//  studings
//
//  Created by Mateus on 12/04/25.
//

import SwiftUI

struct ListPersonInvite: View {
    @State private var name = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Convidado")
                .font(.headline)

            TextField("Informe um nome:", text: $name)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.top, 12)
            
            Button(action: {
                
            }){
                Text("Adicionar")
                    .font(.title2)
                    .foregroundStyle(.black)
                    .padding()
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.top, 12)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.headline)
                    .foregroundStyle(.red)
                
                    .padding(.bottom,30)
            }
        }
        .padding()

        Spacer()
    }
    func addPerson(){
        let trimed = name.trimmingCharacters(in: .whitespaces)
        if trimed.isEmpty{
            errorMessage = "Preencha o campo para cadastrar convidado"
        } else {
            
        }
            
    }
}

#Preview {
    ListPersonInvite()
}
