//
//  UserDataModel.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import Foundation


class UserDataModel: ObservableObject{
	static let shared = UserDataModel()
	@Published var name : String
	@Published var surname : String
	@Published var birthDate : Date
	@Published var email : String
	@Published var password : String
	@Published var height : Double
	@Published var sex : String
	@Published var weight : Double
	@Published var caloriesGoal : Double
	
	init() {
		self.name = ""
		self.surname = ""
		self.birthDate = Date()
		self.email = ""
		self.password = ""
		self.height = 0.0
		self.sex = "select"
		self.weight = 0.0
		self.caloriesGoal = 0.0
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
