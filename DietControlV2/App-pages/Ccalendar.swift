//
//  Calendar.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 28/10/23.
//

import SwiftUI

//funzione per cambiare colore onClick
struct myButton: ButtonStyle{
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.frame(width: 70, height: 80)
			.background(configuration.isPressed ? Color.green:Color(red: 177/255, green: 255/255, blue: 117/255))
			.clipShape(RoundedRectangle(cornerRadius: 15))
		
	}
}


struct Ccalendar: View {
	@State private var selectedButton: String = ""
	
	let buttons = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
	let buttonTexts = [
		"Mo": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"Tu": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"We": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"Th": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"Fr": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"Sa": [ListComponent(title: "Breakfast"), ListComponent(title: "Lunch"), ListComponent(title: "Snaks"), ListComponent(title: "Dinner")],
		"Su":[ListComponent(title: "Breakfast"),ListComponent(title: "Lunch"),ListComponent(title: "Snaks"), ListComponent(title: "Dinner")]
	]
	
	var body: some View {
		
			HStack {
				VStack(spacing: 10) {
					ForEach(buttons, id: \.self) { button in
						Button(action: {
							selectedButton = button
						}) {
							Text(button)
						}
						.foregroundColor(.black)
						.font(.system(size: 30))
						.buttonStyle(myButton())
						.clipShape(RoundedRectangle(cornerRadius: 15))
					}
				}
				.frame(width: 90)
				.listStyle(SidebarListStyle())
				Rectangle().frame(width: 2)
					.foregroundColor(Color(red: 120/255, green: 201/255, blue: 60/255))
				Spacer()
				if !selectedButton.isEmpty{
					ScrollView {
						ForEach(buttonTexts[selectedButton] ?? [ListComponent()]){ element in
							element
								.background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 226/255, green: 164/255, blue: 207/255)))
								.padding(.top, 40)
						}
					}
				}else{
					Text("Select a day")
				}
				Spacer()
			}
			.frame(height: 600)
		}
	}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Ccalendar()
	}
}

