//
//  DetailedPlate.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 28/10/23.
//

import SwiftUI

struct DetailedPlate: View {
	let foodName: String
	let foodDescription: String
	let macronutrientDifference: [String: Double]

	var body: some View {
		ScrollView {
			
			Text("Food details")
				.padding(.top,20)
				.font(.headline)
				.padding(.trailing, 215)
				.fontWeight(.bold)
				.foregroundColor(Color(red: 201/255, green: 60/255, blue: 153/255))
			
			Text(foodDescription)
				.font(.subheadline)
				.foregroundColor(.black)
				.padding(.bottom, 50)
				.padding(.top, 20)
			
			Text("Micronutrients in grams")
				.padding(.bottom,20)
				.font(.headline)
				.padding(.trailing, 130)
				.fontWeight(.bold)
				.foregroundColor(Color(red: 201/255, green: 60/255, blue: 153/255))
			
			VStack(alignment: .leading) {
				
				NutrientDifferenceView(nutrientName: "Protein:", value: macronutrientDifference["protein"] ?? 0, color: Color(red: 120/255, green: 201/255, blue: 60/255))
				NutrientDifferenceView(nutrientName: "Carbs:", value: macronutrientDifference["carbs"] ?? 0, color: Color(red: 120/255, green: 201/255, blue: 60/255))
				NutrientDifferenceView(nutrientName: "Fat:", value: macronutrientDifference["fat"] ?? 0, color: Color(red: 120/255, green: 201/255, blue: 60/255))
			}
		}
		.padding()
		.navigationTitle(self.foodName).navigationBarTitleDisplayMode(.large)
	}
}

struct NutrientDifferenceView: View {
	let nutrientName: String
	let value: Double
	let color: Color

	var body: some View {
		HStack {
			Text(nutrientName)
				.font(.title)
				.fontWeight(.bold)
				.foregroundStyle(color)
			
			Spacer()
			
			
			Text(String(format: "%.2f", value))
				.font(.title)
		}
	}
	
}


struct DetailedCardPreviews: PreviewProvider {
	static var previews: some View {
		DetailedPlate(
			foodName: "Carbonara",
			foodDescription: "Pasta alla carbonara is a characteristic dish of Lazio and more particularly of Rome, prepared with popular ingredients and intense flavor. Today the most recommended ingredients are eggs, guanciale, Pecorino cheese and pepper, but the earliest recipes, in the mid-twentieth century, contemplated pancetta, Parmigiano cheese and even Gruyere and garlic, up to the addition of cream. The most traditionally used types of pasta are spaghetti and rigatoni.",
			macronutrientDifference: [
				"protein": 25,
				"carbs": 79,
				"fat": 17
			]
		)
		.previewLayout(.sizeThatFits)
		.padding()
	}
}

