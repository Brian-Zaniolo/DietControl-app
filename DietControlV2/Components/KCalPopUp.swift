//
//  KCalPopUp.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 17/10/23.
//

import SwiftUI

struct KCalPopUp: View {
	@Binding var user : User
	
	var body: some View {
		ScrollView{
			
			HStack {
				Text("Your daily goal")
					.font(.system(size: 50))
					.padding(.top, 50)
					.padding(.bottom, 20)
				.multilineTextAlignment(.center)
				
			}
			
			Text("Set a goal based on the amount of calories and other nutritional values you want to eat per day")
				.font(.system(size: 20))
				.padding(.bottom, 20)
				.multilineTextAlignment(.center)
			
			Text("Calories goal:")
				.font(.title)
				.bold()
			
			customStepper(value: $user.caloriesGoal)
			
			Text("Carbohydrates goal:")
				.font(.title)
				.bold()
			
			customStepper(value: $user.carbsProgressGoal)
			
			Text("Fat goal:")
				.font(.title)
				.bold()
			
			customStepper(value: $user.fatProgressGoal)
			
			Text("Protein goal:")
				.font(.title)
				.bold()
			
			customStepper(value: $user.proteinProgressGoal)
			
		}
		.frame(maxWidth: 330)
		
		
	}
}

// creiamo un preview provider customizzato in modo da poter passare all'anteprima dati complessi utili al test del funzionamento della pagina
struct KcalPopUpPreview: PreviewProvider {
	
	static var previews: some View {
		@State var user : User = User()
		KCalPopUp(user: $user)
	}
}

// FINE preview provider --------------------------------

struct customStepper: View {
	
	@Binding var value : Double
	
	var body: some View {
		HStack{
			Button(action: {
				if value > 0 {
					value -= 1
				}
			}) {
				ZStack {
					Circle()
						.foregroundColor(Color(red: 242/255, green: 127/255, blue: 203))
						.frame(width: 50, height: 50)
					Text("➖")
						.font(.system(size: 40))
						.foregroundColor(.black)
				}
			}
			
			// Mostriamo le calorie mentre le selezioniamo e diamo la possibilità di digitare direttamente
			TextField("", value:$value, formatter: NumberFormatter())
				.font(.system(size: 40))
				.keyboardType(.numberPad)
				.multilineTextAlignment(.center)
			
			Button(action: {
				if value < 5000 {
					value += 1
				}
			}) {
				ZStack {
					Circle()
						.foregroundColor(Color(red: 242/255, green: 127/255, blue: 203))
						.frame(width: 50, height: 50)
					Text("➕")
						.font(.system(size: 40))
						.foregroundColor(.black)
				}
			}
		}
		.padding(.vertical,20)
	}
}
