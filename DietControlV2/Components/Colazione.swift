//
//  Colazione.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 28/10/23.
//

import SwiftUI

struct Colazione: View {
	
	var title : String
	@Binding var selectedFlavors: [PlateCard]
	@State private var pickers : [ExtractedView] = []
	
	var body: some View {
		VStack {
			HStack {
				Text(self.title).font(.largeTitle)
				Spacer()
				Button(action: {
					selectedFlavors.append(PlateCard())
				}) {
					Image(systemName: "plus")
						.resizable()
						.frame(width: 30, height: 30)
						.foregroundColor(.green)
					
				}
			}
			.frame(minHeight: 50)
			.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 30))
			
			
			List {
				if pickers.isEmpty && selectedFlavors.isEmpty{
					Text("Add a plate").bold()
				}else{
					if !selectedFlavors.isEmpty{
						ForEach(selectedFlavors){ plateCard in
							ExtractedView(selectedFlavors: $selectedFlavors, plate: plateCard.text, id: plateCard.id)
						}
					}
				}
			}
		}
	}
	
}

struct ExtractedView: View, Identifiable {
	
	@Binding var selectedFlavors: [PlateCard]
	@State var plate = String("select")
	@State private var plateCard : PlateCard = PlateCard()
	var id = UUID()
	
	var body: some View {
		VStack{
			Picker("Plate", selection: $plate) {
				Text("Select").tag("select")
				Text("Water").tag("Water")
				Text("Carbonara").tag("Carbonara")
				Text("Peach").tag("Peach")
				Text("Carrots").tag("Carrots")
			}.onChange(of: plate, { oldValue, newValue in
				self.plateCard = PlateCard(
					img: self.plate,
					text: self.plate,
					height: 150,
					width: 160,
					hasToFit: false,
					id: self.id)
				
				let index = selectedFlavors.firstIndex { card in
					card.id == self.id
				}
				
				if index == nil{
					selectedFlavors.append(self.plateCard)
					print("append")
				}else{
					selectedFlavors[index!] = self.plateCard
					print("Insert")
				}
			})
			if plate != "select" {
				Image(plate)
					.resizable()
					.scaledToFill()
					.frame(width: 300, height: 200)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					.clipped()
			}
		}
		.padding()
		.animation(.smooth, value: plate)
	}
}

struct ColazionePreview : PreviewProvider{
	static var previews: some View{
		@State var selectedFlavor : [PlateCard] = []
		Colazione(title: "Prova", selectedFlavors: $selectedFlavor)
	}
}
