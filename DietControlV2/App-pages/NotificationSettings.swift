//
//  NotificationSettings.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 28/10/23.
//

import SwiftUI

struct NotificationSettings: View {
	@EnvironmentObject private var user: User
	
	var body: some View {
		VStack {
			
			HStack {
				Text("Kcal Consumed")
				Spacer()
				Toggle("", isOn: $user.consumedKcal)
					.labelsHidden()
			}
			
			HStack {
				Text("Meals of the Day")
				Spacer()
				Toggle("", isOn: $user.mealReminder)
					.labelsHidden()
			}
			
			HStack {
				Text("Active Sharing")
				Spacer()
				Toggle("", isOn: $user.sharing)
					.labelsHidden()
			}
			
			Spacer()
		}
		.frame(maxWidth: 340)
		.navigationTitle("Notification").navigationBarTitleDisplayMode(.large)
		
	}
}

#Preview {
    NotificationSettings()
}
