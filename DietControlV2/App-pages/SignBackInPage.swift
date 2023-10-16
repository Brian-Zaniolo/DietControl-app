//
//  SignBackInPage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 06/10/23.
//

import SwiftUI

struct SignBackInPage: View {
    var body: some View {
		VStack{
			
			AppLogo().offset(y:40)
			
			Text("SIGN BACK IN").font(.largeTitle).bold().foregroundStyle(.mainGreenAccent)
			
			Text("Choose an account saved in this device:").font(.headline).foregroundStyle(.gray)
			
			Spacer().frame(maxHeight: 50)
			
			VStack(spacing: 5){
				
				HStack {
					
					AppLogo(frameHeight: 80)
					
					VStack {
						StyledNavigationLink(destination: HomePage(), bgColor: .clear, title: "Account Loggato", shadowActive: false, isDisabled: false)
							.foregroundStyle(.black)
						
						Text("logged@logged.com").font(.caption).tint(.gray)
					}
					
					Image(systemName: "arrow.right").foregroundStyle(.gray)
					
					Spacer()
				}
				.padding(10)
				
				
				Divider().frame(maxWidth: 300)
				
				HStack {
					
					Image(systemName: "plus.circle")
						.resizable()
						.frame(maxWidth: 56, maxHeight: 56)
						.aspectRatio(contentMode: .fit)
						.offset(x:7)
					
					StyledNavigationLink(destination: HomePage(), bgColor: .clear, title: "Add Account", shadowActive: false, isDisabled: false)
						.foregroundStyle(.black)
					
					Image(systemName: "arrow.right").foregroundStyle(.gray)
					
					Spacer()
				}
				.padding(10)
				.offset(y:10)
				
				Spacer().frame(maxHeight: 25)
			}
			.frame(maxWidth: 330)
			.overlay(RoundedRectangle(cornerRadius: 10).stroke().foregroundStyle(.uiGray))
			
			Spacer().frame(maxHeight: 50)
			
			Button("Manage Accounts"){
				
			}
			.font(.title3).bold().foregroundStyle(.gray)
			
			Spacer()
		}
    }
}

#Preview {
    SignBackInPage()
}
