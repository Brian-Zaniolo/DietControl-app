//
//  RootPage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 16/10/23.
//

import SwiftUI
import SwiftData

struct RootPage: View {
	
	// in locale, usando app storage, è possibile salvare dei dati nella memoria
	// in questo modo possiamo sapere se è la prima volta che l'app è stata aperta oppure no
	
	@Query private var users : [User]
	@State private var firstTime : Bool = true
	
	var body: some View {
		NavigationStack{
			if firstTime { // scegliamo la schermata da far vedere in base allo stato di first time open
				FirstTimePage()
			}else{
				SignBackInPage()
			}
		}
		.onAppear{
			if !users.isEmpty{
				firstTime = false
			}
		}
    }
}

#Preview {
    RootPage()
}
