//
//  DietControlV2App.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 30/09/23.
//

import SwiftUI
import SwiftData

@main
struct DietControlV2App: App {
	
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			User.self,
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()
	
	static func getUser ( id : String ) {
		
	}
	
	var body: some Scene {
        WindowGroup {
			RootPage()
        }
		.modelContainer(sharedModelContainer)
    }
}
