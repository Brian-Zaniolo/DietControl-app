//
//  HomePage.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
		TabView{
			HomePageContent()
				.tabItem { Label("Home", systemImage: "house.fill")}
			
		}
    }
}

struct HomePageContent: View {
	var body: some View{
		Text("Hello")
	}
}

#Preview {
    HomePage()
}
