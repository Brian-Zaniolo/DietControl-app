//
//  Register.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import SwiftUI

struct RegisterPage: View {
	@State var dataSelezionata : Date = Date()
	var dataOdierna = Date()
	
	var body: some View {
		VStack{
			DatePicker(selection: $dataSelezionata, displayedComponents: .date, label: { Text("Date") })
			Divider()
			Button("Verifica Data"){
				print()
			}
		}
		.frame(maxWidth: 300)
		.padding()
		.overlay(RoundedRectangle(cornerRadius: 10).stroke(.uiGray))
	}
}

#Preview {
	RegisterPage()
}
