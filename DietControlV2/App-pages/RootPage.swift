//
//  SwiftUIView.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 30/09/23.
//

import SwiftUI

struct RootPage: View {
	
    var body: some View {
		NavigationStack{
			Spacer()
			AppLogo()
			VStack (spacing:20){
				HStack{
					Text("Diet")
						.foregroundStyle(.mainGreenAccent)
					
					Text("Control")
						.foregroundStyle(.gray)
				}
				.font(.system(size: 50)).bold()
				
				Text("Keep your diet under control").bold().foregroundStyle(.gray)
			}
			Spacer()
			VStack {
				StyledNavigationLink(destination: RegisterPage(),bgColor: .mainGreenAccent, title: "GET STARTED", textColor: .white, shadowActive: true, isDisabled: false)
				
				StyledNavigationLink(destination: LoginPage(),title: "I HAVE ALREADY AN ACCOUNT", textColor: .gray, isDisabled: false)
			}
			
		}
		
    }
}

#Preview {
    RootPage()
}
