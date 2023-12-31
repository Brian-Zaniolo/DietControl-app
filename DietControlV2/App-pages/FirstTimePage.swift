//
//  SwiftUIView.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 30/09/23.
//

import SwiftUI

struct FirstTimePage: View {
	
	var body: some View {
		VStack{
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
			}
		}
		
	}
}

#Preview {
	FirstTimePage()
}
