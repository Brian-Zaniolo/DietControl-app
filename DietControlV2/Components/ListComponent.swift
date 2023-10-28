//
//  ListComponent.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 28/10/23.
//

import SwiftUI

struct ListComponent: View, Identifiable {
	@State var title = ""
	var id = UUID()
	@State private var selectedFlavor : [PlateCard] = []
	
	var body: some View {
		NavigationLink(destination: Colazione(title: self.title, selectedFlavors: $selectedFlavor)){
			
			VStack {
				Text(title)
					.font(.title).foregroundStyle(.white)
					.frame(maxWidth: .infinity, alignment: .center)
				
				VStack {
					ForEach(self.selectedFlavor){ card in
						card
					}
				}
			}
			.padding()
			.tint(.black)
		}
	}
}

struct ListComponentView_Previews: PreviewProvider {
	static var previews: some View {
		ListComponent(title: "Colazione")
	}
}

