//
//  HomePage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI
import SwiftData

struct HomePage: View {
	@EnvironmentObject private var user : User
	
	@State private var showPopUpNextMeal : Bool = false
	@State private var tabViewSelection : Int = 0
	
	var body: some View {
		NavigationStack{
			TabView(selection : $tabViewSelection){
				
				// HomePage
				ScrollView{
					UserTopPageCard()
					HStack{
						VStack(alignment: .leading){
							Text("Calories Intake")
							Text("\(Int(self.user.earnedCalories)) CAL")
								.font(.title2)
								.foregroundStyle(.mainGreenAccent)
							Text("Daily needs")
							Text("\(Int(self.user.caloriesGoal))").foregroundStyle(.gray)
							Text("Meals made")
							Text("x/x").foregroundStyle(.gray)
						}
						Spacer()
						ZStack{
							Circle()
								.trim(from: 0, to: CGFloat(self.user.earnedCalories / self.user.caloriesGoal))
								.stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
								.foregroundColor(.mainGreenAccent)
								.rotationEffect(.degrees(-90))
								.frame(width: 110, height: 110)
								.animation(.linear(duration: 0.4), value: CGFloat(self.user.earnedCalories / self.user.caloriesGoal))
							Circle()
								.stroke(.mainGreenAccent.tertiary, lineWidth: 30)
								.frame(width: 110,height: 110)
						}
						Spacer()
					}
					.padding()
					.background(.uiGray)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					
					VStack(alignment: .leading, spacing: 10){
						HStack{
							Text("Nutritional Values:")
								.font(.title2)
								.foregroundStyle(.black.secondary)
							
							Spacer()
							
						}
						
						VStack{
							StyledProgressBar(progress: user.carbsProgress, maxValue: user.carbsProgressGoal, measureUnit: "g", progressColor: .mainGreenAccent, text: "Carbs", textColor: .gray)
							
							StyledProgressBar(progress: user.proteinProgress, maxValue: user.proteinProgressGoal, measureUnit: "g", progressColor: .mainGreenAccent, text: "Protein", textColor: .gray)
							
							StyledProgressBar(progress: user.fatProgress, maxValue: user.fatProgressGoal, measureUnit: "g", progressColor: .mainGreenAccent, text: "Fat", textColor: .gray)
							
							StyledProgressBar(progress: user.waterProgress, maxValue: user.waterProgressGoal, measureUnit: "l", progressColor: .mainGreenAccent, text: "Water", textColor: .gray)
						}
						.padding()
						
					}
					
					VStack(spacing: 10){
						HStack{
							Text("Next meal:")
								.font(.title2)
								.foregroundStyle(.black.secondary)
							
							Spacer()
							
							Button("Show more"){
								print("BBBBB")
								self.showPopUpNextMeal.toggle()
							}
							.foregroundStyle(.mainGreenAccent)
							.popover(isPresented: $showPopUpNextMeal, content: {
								NextMealDetail()
							})
						}
						
						PlateCard(img: "Carbonara", text: "Carbonara", height: 200, width: 340, hasToFit: true)
						
					}
				}
				.frame(maxWidth: 340)
				.scrollIndicators(.never)
				.tabItem {
					Label(title: {Text("Home")},
					icon: {Image(systemName: "house.fill")})
				}
				.tag(0)
				// Calendar
				
				Ccalendar()
					.navigationTitle("Calendar").navigationBarTitleDisplayMode(.large)
					.tabItem {
						Label(title: {Text("Calendar")},
						icon: {Image(systemName: "calendar")})
					}
					.tag(1)
			}
			.tint(.purple)
			.tabViewStyle(DefaultTabViewStyle())
			.navigationBarBackButtonHidden()
			.navigationTitle(self.tabViewSelection == 0 ? "HomePage" : "Calendar")
			.navigationBarTitleDisplayMode(.large)
		}
		.environmentObject(self.user)
	}
}


struct pagePreview : PreviewProvider{
	static var previews: some View {
		@StateObject var user : User = 	User(name: "Brian", surname: "Zaniolo", email: "example@example.com", earnedCalories: 1000)
		VStack{
			HomePage()
		}
		.environmentObject(user)
	}
}
