//
//  SwiftUIView.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 30/09/23.
//

import SwiftUI

struct RootPage: View {
	@State var prova = 0
	
    var body: some View {
		NavigationStack{
			Image(systemName: "globe")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxHeight: 100)
				.foregroundStyle(.gray)
			
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
			
			VStack {
				StyledNavigationLink(destination: RegisterPage(),bgColor: .mainGreenAccent, title: "GET STARTED", textColor: .white, shadowActive: true)
				
				StyledNavigationLink(destination: RegisterPage(),title: "I HAVE ALREADY AN ACCOUNT", textColor: .gray)
			}
			.offset(x:0,y: 200)
		}
		
    }
}

#Preview {
    RootPage()
}
