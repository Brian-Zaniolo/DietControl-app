//
//  SwiftUIView.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 30/09/23.
//

import SwiftUI

struct ColoredButton: View {
	var actionFunction : () -> Any = {print("Il pulsante funziona")}
	var bgColor : Color = .clear
	var label : String = "Testo Predefinito"
	var textColor : Color = .text
	var shadowActive : Bool = false
	
    var body: some View {
		Button(){
			actionFunction()
		}label: {
			Text(label)
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

#Preview{
	ColoredButton()
}

