//
//  Register.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import SwiftUI

struct RegisterPage: View {
	
	// questo è come si recupera il contesto, in questo modo è pronto per poter essere utilizzato
	@ObservedObject var userData : UserDataModel = .shared
	
	@State var confirmUserPassword : String = ""
	@State var isEmpty : Bool = false
	
		
	
	var checkPassword : Bool { // verifichiamo che il contenuto dei due campi sia uguale e che questi non siano vuoti
		return (userData.password == confirmUserPassword) && !confirmUserPassword.isEmpty && !userData.password.isEmpty
	}

	var body: some View {
		

		VStack{
			Spacer()
			Text("Enter your data").font(.largeTitle).multilineTextAlignment(.leading).bold()
			Spacer().frame(maxHeight: 40)
			VStack{
				TextFieldWithError(text: $userData.name, placeholder: "Enter name")
				Divider()
				TextFieldWithError(text: $userData.surname, placeholder: "Enter surname")
				Divider()
				TextFieldWithError(text: $userData.email, placeholder: "Enter email", isEmailField: true)
				Divider()
				TextFieldWithError(text: $userData.password, placeholder: "Enter password", isSecure: true)
				Divider()
				TextFieldWithError(text: $confirmUserPassword, placeholder: "Confirm password", isSecure: true)
				Divider()
				DatePicker(selection: $userData.birthDate, displayedComponents: .date, label: { Text("Date of Birth:")})
				Divider()
				HStack {
					Text("Select sex:")
					Spacer()
					Picker("Select sex", selection: $userData.sex){
						Text("Select").tag("select")
						Text("Male").tag("male")
						Text("Female").tag("female")
					}
				}
			}
			.frame(maxWidth: 300)
			.padding()
			.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.uiGray))
			Spacer()
			StyledNavigationLink(destination: HomePage(), bgColor: .mainGreenAccent, title: "SIGN UP", textColor: .white, shadowActive: true, isDisabled: !userData.isOverLegalAge || userData.areRequiredEmpty || !checkPassword || !userData.isAnEmail)
				.simultaneousGesture(TapGesture().onEnded{
					UserDefaults.standard.set(false, forKey: "FirstTimeOpen")
					print(UserDefaults.standard.bool(forKey: "FirstTimeOpen"))
				})
			
		}
	}
}

#Preview {
	RegisterPage()
}
