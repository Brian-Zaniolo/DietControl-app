//
//  LoginPage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct LoginPage: View {
	
	@State private var user = User()
	
    var body: some View {
		Text("ENTER INFO. TO LOG IN").font(.title).bold()
		VStack(spacing:20){
			TextFieldWithError(text: $user.email, placeholder: "Enter email", isEmailField: true)
			Divider()
			TextFieldWithError(text: $user.password, placeholder: "Enter password", isSecure: true)
		}
		.frame(maxWidth: 300)
		.font(.title3)
		.padding()
		.overlay(RoundedRectangle(cornerRadius: 10).stroke(.uiGray))
		Spacer().frame(maxHeight: 30)
		StyledNavigationLink(destination: Text(""),bgColor: .mainGreenAccent, title: "LOG IN", textColor: .white, shadowActive: true, isDisabled: user.areEmailPasswordInValid)
    }
}

#Preview {
    LoginPage()
}
