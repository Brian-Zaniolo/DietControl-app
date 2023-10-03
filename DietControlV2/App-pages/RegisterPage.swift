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
	

	var body: some View {
		VStack{
			Text("Enter your data").font(.largeTitle).multilineTextAlignment(.leading).bold()
			VStack{
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
						Text("Male").tag("Male")
						Text("Female").tag("Female")
					}
				}
			}
			.frame(maxWidth: 300)
			.padding()
			.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.uiGray))
			
			StyledNavigationLink(destination: RootPage(), bgColor: .mainGreenAccent, title: "SIGN UP", textColor: .white, isDisabled: !userData.isOverLegalAge)
		}
	}
}

#Preview {
	RegisterPage()
}
