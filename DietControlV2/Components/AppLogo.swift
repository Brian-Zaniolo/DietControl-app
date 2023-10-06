//
//  AppLogo.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct AppLogo: View {
	
	@Environment(\.colorScheme) private var colorScheme
	var frameHeight : Double = 300
	
    var body: some View {
		
		if colorScheme == .light{
			Image("AppLogo")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.colorInvert()
				.frame(maxHeight: frameHeight)
				.foregroundStyle(.gray)
		}else{
			Image("AppLogo")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxHeight: frameHeight)
				.foregroundStyle(.gray)
		}
		
    }
}

#Preview {
	AppLogo()
}
