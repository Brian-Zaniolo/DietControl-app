//
//  HomePage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct HomePage: View {
	
	@ObservedObject var userData : UserDataModel = .shared
	
	var body: some View {
		NavigationStack{
			TabView{
				HomePageContent()
					.tabItem { Label("Home", systemImage: "house.fill")}
			}
			.navigationBarBackButtonHidden()
			.toolbar{
				ToolbarItem(placement: .topBarLeading){
					Text("Welcome \(userData.name)").font(.largeTitle)
				}
			}
		}
	}
}


struct HomePageContent: View {
	
	@ObservedObject var userData : UserDataModel = .shared
	private var today : Date = Date()
	@State var progress : Double = 200
	
	var body: some View{
		ScrollView{
			HStack{
				VStack(alignment: .leading){
					Text(today.formatted(date: .complete, time: .omitted))
						.font(.caption)
					Text("Here is your summary \(userData.name)")
				}
				Spacer()
				Image("AppLogo")
					.resizable()
					.scaledToFit()
					.frame(width: 50, height: 50)
					.background(.mainGreenAccent.secondary)
					.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
			}
			.padding()
			.background(.uiGray)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			
			HStack{
				VStack(alignment: .leading){
					Text("Calories Intake")
					Text("xx CAL")
						.font(.title2)
						.foregroundStyle(.mainGreenAccent)
					Text("Daily needs")
					Text("xx").foregroundStyle(.gray)
					Text("Meals made")
					Text("x/x").foregroundStyle(.gray)
				}
				Spacer()
				ZStack{
					Circle()
						.trim(from: 0.0, to: 0.01)
						.stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round))
						.foregroundColor(.mainGreenAccent)
						.rotationEffect(.degrees(-90))
						.frame(width: 110, height: 110)
					
					Circle()
						.stroke(.mainGreenAccent.tertiary, lineWidth: 30)
						.frame(width: 110,height: 110)
				}
				Spacer()
			}
			.padding()
			.background(.uiGray)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			//ProgressView(value: 200, total: 2000).progressViewStyle(CircularProgressViewStyle())
			
			VStack(alignment: .leading, spacing: 10){
				Text("Nutritional Values:")
					.font(.title2)
					.foregroundStyle(.black.secondary)
				VStack{
					StyledProgressBar(measureUnit: "g", text: "Carbs", textColor: .gray)
					StyledProgressBar(measureUnit: "g",text: "Protein", textColor: .gray)
					StyledProgressBar(measureUnit: "g",text: "Fat", textColor: .gray)
					StyledProgressBar(measureUnit: "l",text: "Water", textColor: .gray)
				}
			}
			
			VStack(alignment: .leading, spacing: 10){
				Text("Nutritional Values:")
					.font(.title2)
					.foregroundStyle(.black.secondary)
				ZStack(alignment:.bottom){
					
					Image("AppLogo")
						.resizable()
						.background(.green)
						.clipShape(RoundedRectangle(cornerRadius: 10))
					
					Text("Piatto di prova")
						.padding()
						.frame(width: 320,alignment:.leading)
						.background(.white.secondary)
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.font(.title3)
						.offset(y:-10)
				}
				.frame(width: 340, height: 170)
			}
		}
		.frame(maxWidth: 340)
		.scrollIndicators(.never)
	}
}

#Preview {
	HomePage()
}
