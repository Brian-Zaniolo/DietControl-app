//
//  RootPage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 16/10/23.
//

import SwiftUI

struct RootPage: View {
	
	// in locale, usando app storage, è possibile salvare dei dati nella memoria
	// in questo modo possiamo sapere se è la prima volta che l'app è stata aperta oppure no
	@AppStorage("FirstTimeOpen") var FirstTimeOpen : Bool = true
	@State var isFirstTime : Bool = true
    
	var body: some View {
		NavigationStack{
			if FirstTimeOpen{ // scegliamo la schermata da far vedere in base allo stato di first time open
				FirstTimePage()
			}else{
				SignBackInPage()
			}
		}
    }
}

#Preview {
    RootPage()
}
