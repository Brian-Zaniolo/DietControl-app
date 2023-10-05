//
//  LoginPage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct LoginPage: View {
	
	@State var userData : UserDataModel = UserDataModel()
	
    var body: some View {
		Text("Enter info to log in").font(.title).bold()
		VStack{
			TextFieldWithError(text: $userData.email, placeholder: "Enter email", isEmailField: true)
			Divider()
			TextFieldWithError(text: $userData.password, placeholder: "Enter password", isSecure: true)
		}
		.frame(maxWidth: 300)
		.font(.title3)
		.padding()
		.overlay(RoundedRectangle(cornerRadius: 10).stroke(.uiGray))
		Spacer().frame(maxHeight: 30)
		StyledNavigationLink(destination: RegisterPage(),bgColor: .mainGreenAccent, title: "LOG IN", textColor: .white, shadowActive: true, isDisabled: userData.areEmailPasswordInValid)
    }
}

#Preview {
    LoginPage()
}
