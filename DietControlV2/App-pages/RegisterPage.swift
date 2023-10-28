//
//  Register.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import SwiftUI

struct RegisterPage: View {
	
	// questo è come si recupera il contesto, in questo modo è pronto per poter essere utilizzato
	@Environment(\.modelContext) private var context
	
	// creiamo un oggetto che possa contenere le informazioni utente
	@State var user : User = User()
	
	@State private var confirmUserPassword : String = ""
	@State private var isEmpty : Bool = false
	@State private var showCal : Bool = false
	@State private var calNotSet : Bool = true
	
	var checkPassword : Bool { // verifichiamo che il contenuto dei due campi sia uguale e che questi non siano vuoti
		return (user.password == confirmUserPassword) && !confirmUserPassword.isEmpty && !user.password.isEmpty
	}
	
	var body: some View {
		
		
		VStack{
			Spacer()
			Text("Enter your data").font(.largeTitle).multilineTextAlignment(.leading).bold()
			Spacer().frame(maxHeight: 40)
			VStack{
				TextFieldWithError(text: $user.name, placeholder: "Enter name")
				Divider()
				TextFieldWithError(text: $user.surname, placeholder: "Enter surname")
				Divider()
				TextFieldWithError(text: $user.email, placeholder: "Enter email", isEmailField: true)
				Divider()
				TextFieldWithError(text: $user.password, placeholder: "Enter password", isSecure: true)
				Divider()
				TextFieldWithError(text: $confirmUserPassword, placeholder: "Confirm password", isSecure: true)
				Divider()
				DatePicker(selection: $user.birthDate, displayedComponents: .date, label: { Text("Date of Birth:")})
				Divider()
				HStack {
					Text("Select sex:")
					Spacer()
					Picker("Select sex", selection: $user.sex){
						Text("Select").tag("select")
						Text("Male").tag("male")
						Text("Female").tag("female")
					}
					.tint(.mainGreenAccent)
				}
			}
			.frame(maxWidth: 300)
			.padding()
			.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.uiGray))
			Spacer()
			Button("Set Calories Goal"){
				self.showCal.toggle()
			}
			.tint(.mainGreenAccent)
			
			StyledNavigationLink(destination: SignBackInPage(), bgColor: .mainGreenAccent, title: "SIGN UP", textColor: .white, shadowActive: true, isDisabled: !user.isOverLegalAge || user.areRequiredEmpty || !checkPassword || !user.isAnEmail || calNotSet)
				
		}
		.fullScreenCover(isPresented: $showCal, onDismiss: {}, content: {
			KCalPopUp(user: self.$user)
			Button("Done"){
				// impostiamo lo stato del popUp a true in modo che possa esser mostrato e inseriamo i dati utente nel database locale
				self.showCal.toggle()
				context.insert(user)
				do { try context.save() } catch {print("Errore nel salvataggio")}
				self.calNotSet.toggle()
			}
			.font(.title2).bold()
			.foregroundStyle(.white)
			.frame(width: 340, height: 50)
			.background(.mainGreenAccent)
			.clipShape(.rect(cornerRadius: 10))
		})
	}
}

#Preview {
	RegisterPage()
}
