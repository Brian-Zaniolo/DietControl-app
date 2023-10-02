//
//  UserDataModel.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 02/10/23.
//

import Foundation

struct UserDataModel {
	var name : String
	var surname : String
	var birthDate : Date
	var email : String
	var password : String
	var height : Double
	var sex : String
	var weight : Double
	var caloriesGoal : Double
	
	
	init(name: String, surname: String, birthDate: Date, email: String, password: String, height: Double, sex: String, weight: Double, caloriesGoal: Double) {
		self.name = name
		self.surname = surname
		self.birthDate = birthDate
		self.email = email
		self.password = password
		self.height = height
		self.sex = sex
		self.weight = weight
		self.caloriesGoal = caloriesGoal
	}
	
	var isOverLegalAge : Bool {
		return Calendar.current.component(.year, from: Date()) - Calendar.current.component(.year, from: birthDate) > 18 ? true : false
	}
	
}
