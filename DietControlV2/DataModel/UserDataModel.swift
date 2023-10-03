//
//  UserDataModel.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import Foundation

class UserDataModel : ObservableObject{	
	var name : String
	var surname : String
	var birthDate : Date
	var email : String
	var password : String
	var height : Double
	var sex : String
	var weight : Double
	var caloriesGoal : Double
	
	
	init() {
		self.name = ""
		self.surname = ""
		self.birthDate = Date()
		self.email = ""
		self.password = ""
		self.height = 0.0
		self.sex = ""
		self.weight = 0.0
		self.caloriesGoal = 0.0
	}
	
	var isOverLegalAge : Bool {
		return Calendar.current.component(.year, from: Date()) - Calendar.current.component(.year, from: birthDate) > 18 ? true : false
	}
	
}
