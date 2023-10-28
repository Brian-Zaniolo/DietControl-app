//
//  UserTopPageCard.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 21/10/23.
//

import SwiftUI

struct UserTopPageCard: View {
	
	@EnvironmentObject private var user : User
	private var today : Date = Date()
	
    var body: some View {
		NavigationLink(destination: AccountView().environmentObject(self.user)){
			VStack(alignment: .leading){
				Text(today.formatted(date: .complete, time: .omitted))
					.font(.caption)
				Text("Here is your summary")
			}
			Spacer()
			Image("AppLogo")
				.resizable()
				.scaledToFit()
				.frame(width: 50, height: 50)
				.background(.mainGreenAccent.secondary)
				.clipShape(Circle())
		}
		.padding()
		.background(.uiGray)
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.foregroundStyle(.text)
    }
}

struct userCardPreview : PreviewProvider{
	static var previews: some View {
		@StateObject var user : User = 	User(name: "Brian", surname: "Zaniolo", email: "example@example.com", earnedCalories: 1000)
		VStack{
			UserTopPageCard()
		}
		.environmentObject(user)
	}
}
