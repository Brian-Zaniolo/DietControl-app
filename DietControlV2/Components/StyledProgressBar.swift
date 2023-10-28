//
//  StyledProgressBar.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 13/10/23.
//

import SwiftUI

struct StyledProgressBar: View {
	
	var progress : Double = 0
	var maxValue : Double = 1
	var measureUnit : String = ""
	var progressColor : Color = .gray
	var text : String = ""
	var textColor : Color = .black
	
	var body: some View {
		VStack(alignment:.trailing){
			ProgressView(value: progress, total: maxValue,label: {
				Text(self.text)
					.foregroundStyle(textColor)
			})
			.tint(progressColor)
			.animation(.linear(duration: 0.5), value: progress)
			
			Text("\(self.progress.description)/\(self.maxValue.description) \(self.measureUnit)")
				.font(.caption)
		}
	}
}

#Preview {
	StyledProgressBar(maxValue: 1, measureUnit: "g", text: "Ciao")
}
