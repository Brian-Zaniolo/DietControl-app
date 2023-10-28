//
//  userBackInCard.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 20/10/23.
//

import SwiftUI

struct userBackInCard: View {
	
	let user : User
	
    var body: some View {
		HStack {
			
			AppLogo(frameHeight: 80)
			
			VStack {
				StyledNavigationLink(destination: HomePage(/*user: self.user*/).environmentObject(user), bgColor: .clear, title: "\(user.name) \(user.surname)", shadowActive: false, isDisabled: false)
					.foregroundStyle(.black)
				Text("\(user.email)").font(.caption).tint(.gray)
			}
			Image(systemName: "arrow.right").foregroundStyle(.gray)
			Spacer()
		}
		.padding(10)
    }
}

#Preview {
	userBackInCard(user: User())
}
