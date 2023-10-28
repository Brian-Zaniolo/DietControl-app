//
//  UserDataModel.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import Foundation
import SwiftData

@Model
class User : Identifiable, ObservableObject {
	var id : String
	var name : String
	var surname : String
	var birthDate : Date
	var email : String
	var password : String
	var height : Int
	var sex : String
	var weight : Int
	// Progress var
	var carbsProgress : Double
	var proteinProgress : Double
	var fatProgress : Double
	var waterProgress : Double
	//Goal var
	var caloriesGoal : Double
	var earnedCalories : Double
	var carbsProgressGoal : Double
	var proteinProgressGoal : Double
	var fatProgressGoal : Double
	var waterProgressGoal : Double
	//Notification settings
	var consumedKcal : Bool
	var mealReminder : Bool
	var sharing : Bool
	
	// Default initializer
	init() {
		self.id = UUID().uuidString
		self.name = String()
		self.surname = String()
		self.birthDate = Date()
		self.email = String()
		self.password = String()
		self.height = Int()
		self.sex = "select"
		self.weight = Int()
		self.caloriesGoal = 2200.0
		self.earnedCalories = Double(1200)
		
		
		// Progress var
		self.proteinProgress = Double(10)
		self.carbsProgress = Double(24)
		self.fatProgress = Double(7)
		self.waterProgress = Double(0.9)
		
		//Goal var
		self.carbsProgressGoal = Double(50)
		self.proteinProgressGoal = Double(30)
		self.fatProgressGoal = Double(26)
		self.waterProgressGoal = Double(2)
		
		// Notifification settings
		self.consumedKcal = false
		self.mealReminder = false
		self.sharing = false
	}
	
	// initializer with parameter
	init( name : String, surname : String, email: String, earnedCalories : Double) {
		self.id = UUID().uuidString
		self.name = name
		self.surname = surname
		self.birthDate = Date()
		self.email = email
		self.password = String()
		self.height = Int()
		self.sex = "select"
		self.weight = Int()
		self.caloriesGoal = 2000.0
		self.earnedCalories = Double()
		
		
		// Progress var
		self.proteinProgress = Double(0)
		self.carbsProgress = Double(0)
		self.fatProgress = Double(0)
		self.waterProgress = Double(0)
		
		//Goal var
		self.carbsProgressGoal = Double(1)
		self.proteinProgressGoal = Double(1)
		self.fatProgressGoal = Double(1)
		self.waterProgressGoal = Double(1)
		
		// Notifification settings
		self.consumedKcal = false
		self.mealReminder = false
		self.sharing = false
		
	}
	
	var isOverLegalAge : Bool {
		return Calendar.current.component(.year, from: Date()) - Calendar.current.component(.year, from: self.birthDate) > 18 ? true : false
	}
	
	var areRequiredEmpty : Bool {
		return self.name.isEmpty || self.surname.isEmpty || self.email.isEmpty || self.password.isEmpty || self.sex == "select"
	}
	
	var isAnEmail : Bool {
		let regex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: self.email)
	}
	
	var areEmailPasswordInValid : Bool {
		return self.email.isEmpty || self.password.isEmpty || !self.isAnEmail
	}
	
	var isConfigComplete : Bool {
		return !areRequiredEmpty && isOverLegalAge
	}
}
