//
//  TextFieldWithError.swift
//  DietControlV2
//
//  Created by Brian Zaniolo on 05/10/23.
//

import SwiftUI

struct TextFieldWithError: View {
	
	@Binding var text : String
	var emailCheck : Bool
	@State private var hasError : Bool = true
	var placeholder : String?
	var isSecure : Bool?
	
	var isAnEmail : Bool {
		let regex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
		let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
		return predicate.evaluate(with: self.text)
	}
	
	init(text: Binding<String>, placeholder: String? = nil, isSecure: Bool? = nil, isEmailField:Bool? = nil) {
		_text = text
		self.placeholder = placeholder
		self.isSecure = isSecure
		self.emailCheck = isEmailField ?? false
	}
	
    var body: some View {
		if isSecure ?? false{
			SecureField(self.placeholder ?? "Default placeholder", text: self.$text)
				.onChange(of: self.text){
					hasError = self.text.isEmpty
				}
				.underline(color: hasError ? .red : .clear)
		}else if emailCheck{
			TextField(self.placeholder ?? "Default placeholder", text: self.$text)
				.onChange(of: self.text){
					hasError = self.text.isEmpty || !isAnEmail
				}
				.underline(color: hasError ? .red : .clear)
		}else{
			TextField(self.placeholder ?? "Default placeholder", text: self.$text)
				.onChange(of: self.text){
					hasError = self.text.isEmpty
				}
				.underline(color: hasError ? .red : .clear)
		}
    }
}


//container per provare il componente ⬇️
struct TextFieldWithErrorContainer: View {
	@State var testo : String = ""
	var body: some View{
		//TextFieldWithError(text: $testo, placeholder: "ciao")
		//TextFieldWithError(text: $testo, isSecure: true)
		TextFieldWithError(text: $testo, isEmailField: true)
	}
}

#Preview{
	TextFieldWithErrorContainer()
}
