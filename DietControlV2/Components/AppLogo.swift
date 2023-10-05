//
//  AppLogo.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct AppLogo: View {
	
	@Environment(\.colorScheme) var colorScheme
	
    var body: some View {
		
		if colorScheme == .light{
			Image("AppLogo")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.colorInvert()
				.frame(maxHeight: 300)
				.foregroundStyle(.gray)
		}else{
			Image("AppLogo")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxHeight: 300)
				.foregroundStyle(.gray)
		}
		
    }
}

#Preview {
    AppLogo()
}
