//
//  PlateCard.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 21/10/23.
//

import SwiftUI

struct PlateCard: View, Identifiable, Equatable {
	
	var img : String = String()
	var text : String = String("select")
	var height : CGFloat = CGFloat()
	var width : CGFloat = CGFloat()
	var hasToFit: Bool = Bool()
	var id = UUID()
	
	var body: some View {
		ZStack(alignment: .bottom){
			Image(self.img)
				.resizable()
			//.aspectRatio(contentMode: self.hasToFit ? .fit : .fill)
				.frame(width: self.width, height: self.height)
			if self.text == "Carbonara"{
				NavigationLink(destination: DetailedPlate(foodName: self.text, foodDescription: "Pasta alla carbonara is a characteristic dish of Lazio and more particularly of Rome, prepared with popular ingredients and intense flavor. Today the most recommended ingredients are eggs, guanciale, Pecorino cheese and pepper, but the earliest recipes, in the mid-twentieth century, contemplated pancetta, Parmigiano cheese and even Gruyere and garlic, up to the addition of cream. The most traditionally used types of pasta are spaghetti and rigatoni.", macronutrientDifference: [
					"protein": 25,
					"carbs": 79,
					"fat": 17
				]
														 ), label: {
					Text(self.text)
						.padding(5)
						.font(.title2).foregroundStyle(.white)
						.frame(maxWidth: self.width-20)
						.background(.black.secondary)
						.clipShape(RoundedRectangle(cornerRadius: 10))
						.offset(y:-10)
				})
			}else{
				Text(self.text)
					.padding(5)
					.font(.title2).foregroundStyle(.white)
					.frame(maxWidth: self.width-20)
					.background(.black.secondary)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.offset(y:-10)
			}
		}
		.frame(maxWidth: self.width, maxHeight: self.height)
		.clipped()
		.clipShape(RoundedRectangle(cornerRadius: 10))
		.shadow(color: .gray, radius: 5, y:6)
		.overlay(
			RoundedRectangle(cornerRadius: 10)
				.stroke()
				.foregroundStyle(.black.tertiary)
		)
	}
}

#Preview {
	PlateCard(img: "Water", text: "Carbonara", height: 300, width: 200,hasToFit: false)
}
