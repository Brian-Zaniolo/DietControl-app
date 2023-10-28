//
//  fileDiProva.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 18/10/23.
//

import SwiftUI

struct fileDiProva: View {
	@State private var isKcalConsumedOn = false
	@State private var isMealsOfDayOn = false
	@State private var isSharingActiveOn = false
	
	var body: some View {
		VStack {
			
			HStack {
				Text("Kcal Consumed")
				Spacer()
				Toggle("", isOn: $isKcalConsumedOn)
					.labelsHidden()
			}
			
			HStack {
				Text("Meals of the Day")
				Spacer()
				Toggle("", isOn: $isMealsOfDayOn)
					.labelsHidden()
			}
			
			HStack {
				Text("Active Sharing")
				Spacer()
				Toggle("", isOn: $isSharingActiveOn)
					.labelsHidden()
			}
			
			Spacer()
		}
		.navigationTitle("Notification").navigationBarTitleDisplayMode(.large)
		.padding()
	}
}


#Preview {
	fileDiProva()
}
