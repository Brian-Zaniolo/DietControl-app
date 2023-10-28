//
//  HealthDetail.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 27/10/23.
//

import SwiftUI

struct HealthDetail: View {
	@EnvironmentObject private var user : User
	@Environment(\.modelContext) private var context
	
	var body: some View {
		VStack {
			
			Text("Personalize Your Personal Information")
				.font(.title)
				.padding(.top, 20)
				.multilineTextAlignment(.center)
			
			Spacer().frame(maxHeight: 50)
			
			HStack {
				Text("Date of Birth:")
				Spacer()
				DatePicker("", selection: $user.birthDate, displayedComponents: .date)
					.labelsHidden()
					.datePickerStyle(.compact)
			}
			
			HStack {
				Text("Sex:")
				Spacer()
				Picker("Sex", selection: $user.sex) {
					Text("M").tag("male")
					Text("F").tag("female")
				}
				.pickerStyle(SegmentedPickerStyle())
				.frame(width: 95)
			}
			
			HStack {
				Text("Height (cm):")
				Spacer()
				Picker("your metres: ", selection: $user.height){
					ForEach(1...250, id: \.self){
						number in
						Text("\(number)")
					}
				}
				.tint(.green)
				
			}
			HStack {
				Text("Weight (kg):")
				Spacer()
				Text("Kg:")
				Picker("your kilos: ", selection: $user.weight){
					ForEach(1...500, id: \.self){
						number in
						Text("\(number)")
					}
				}
				.tint(.green)
			}
			Spacer()
			
			Button(action: {
				// Puoi implementare l'azione del bottone Done qui
				do{
					try self.context.save()
					Alert(title: Text("Saved"))
				}catch{
					Alert(title: Text("Can't save data right now, retry"))
				}
				
			}) {
				Text("Done")
					.font(.headline)
					.foregroundColor(.white)
					.frame(width: 300, height: 50)
					.background(Color(red: 120/255, green: 201/255, blue: 0))
					.cornerRadius(10)
			}
			.padding(.bottom, 20)
		}
		.navigationTitle("Healt Details").navigationBarTitleDisplayMode(.large)
		.padding()
	}
}


