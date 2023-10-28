//
//  NextMealDetail.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 21/10/23.
//

import SwiftUI

struct NextMealDetail: View {
	
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		
		VStack(spacing:20){
			
			HStack {
				Spacer()
				Button("Done"){
					dismiss()
				}
				.font(.title2)
				.foregroundStyle(.mainGreenAccent)
			}
			
			HStack{
				Text("Your next meal:").font(.largeTitle)
				Spacer()
			}
			HStack{
				PlateCard(img: "Water", text: "Water", height: 200, width: 160, hasToFit: false)
				PlateCard(img: "Carrots", text: "Carrot", height: 200, width: 160, hasToFit: false)
			}
			
			PlateCard(img: "Carbonara", text: "Carbonara", height: 150, width: 340, hasToFit: false)
			
			PlateCard(img: "Peach", text: "Peach", height: 150, width: 340, hasToFit: false)
		}
		.padding()
	}
	
	
}

#Preview {
	NextMealDetail()
}
