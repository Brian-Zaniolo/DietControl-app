//
//  StyledNavigationLink.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import SwiftUI

struct StyledNavigationLink<Content: View>: View {
	
	var destination: Content = Text("Funziona") as! Content
	var bgColor : Color = .clear
	var title : String = "Testo Predefinito"
	var textColor : Color = .text
	var shadowActive : Bool = false
	
	var body: some View {
		
		NavigationLink(destination: destination){
			Text(title)
				.font(.headline).tint(textColor).bold()
				.frame(maxWidth: 300, maxHeight: 40)
				.background(bgColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.shadow(
					color: shadowActive ? .gray : .clear,
					radius: shadowActive ? 5 : 0,
					x: 0,
					y: shadowActive ? 4 : 0
				)
		}
		
		
	}
}


