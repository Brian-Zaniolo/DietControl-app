//
//  Register.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import SwiftUI

struct RegisterPage: View {
	
	@State var userData : UserDataModel = UserDataModel()
	@State var confirmUserPassword : String = ""
	
	var checkPassword : Bool {
		return (userData.password == confirmUserPassword) && !confirmUserPassword.isEmpty && !userData.password.isEmpty
	}

	var body: some View {
		VStack{
			Text("Enter your data").font(.largeTitle).multilineTextAlignment(.leading).bold()
			VStack{
				TextField("Enter Name", text: $userData.name)
				Divider()
				TextField("Enter surname", text: $userData.surname)
				Divider()
				TextField("Enter Mail", text: $userData.email)
				Divider()
				SecureField("Enter Password", text: $userData.password)
				Divider()
				SecureField("Confirm Password", text: $confirmUserPassword)
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
			
			StyledNavigationLink(destination: OptionalInfo(), bgColor: .mainGreenAccent, title: "SIGN UP", textColor: .white, shadowActive: true, isDisabled: !userData.isOverLegalAge || userData.areRequiredEmpty || !checkPassword)
		}
	}
}

#Preview {
	RegisterPage()
}
