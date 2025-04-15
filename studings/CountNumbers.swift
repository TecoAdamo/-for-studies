//
//  CountNumbers.swift
//  studings
//
//  Created by Mateus on 15/04/25.
//

import SwiftUI

struct CountNumbers: View {
	@State var numberCount = 0
	@State var messageFinish = ""
    var body: some View {
			VStack {
				Text("Contador: \(numberCount)")
				HStack{
					Button(action: {
						incrementCount()
					}, label: {
						Text("Contar")
					})
					.disabled(numberCount == 10)
					Spacer()
					Button(action: {
						regressCount()
					}, label: {
						Text("Regredir")
					})
					.disabled(numberCount == 0)

				}
				.padding(60)
			}
			Text(messageFinish)
				.foregroundStyle(.orange)
    }
	func incrementCount(){
		numberCount += 1
		if numberCount == 10{
			messageFinish = "Voce chegou ao limite da contagem."
		}
	}
	func regressCount(){
		if numberCount > 0{
			numberCount -= 1
			if numberCount < 10{
				messageFinish = ""
			}
		}
	}
}

#Preview {
    CountNumbers()
}
