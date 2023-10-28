import SwiftUI

struct AccountView: View {
	
	@EnvironmentObject private var userObj : User
	@State private var user : User = User()
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		
			VStack(spacing:30){

				HStack{
					Spacer()
					Image(systemName:  "person.crop.circle")
						.resizable()
						.frame(width: 50, height: 50)
						.foregroundStyle(Color .black)
					Spacer()
					Text("\(self.user.name) \(self.user.surname) \n \(self.user.email)" )
						.frame(minHeight: 50)
						.multilineTextAlignment(.center)
					Spacer()
				}
				.padding()
				.background(Color .gray.opacity(0.2))
				.clipShape(RoundedRectangle(cornerRadius: 10))
				
				settingsOption(title: "Health details", destination: HealthDetail().environmentObject(user))
				settingsOption(title: "Change calory goal", destination: KCalPopUp(user: $user))
				settingsOption(title: "Notification", destination: NotificationSettings().environmentObject(user))
				settingsOption(title: "Privacy", destination: Text("Health details"))
				
				Spacer()
			}
			.frame(maxWidth: 340)
			.onAppear{
				self.user = self.userObj
			}
			.navigationTitle("Account Settings").navigationBarTitleDisplayMode(.large)
		}
	}



//Preview --------------------------------------------------
struct AccountViewPreviews: PreviewProvider {
	static var previews: some View {
		@StateObject var user : User = 	User(name: "Brian", surname: "Zaniolo", email: "example@example.com", earnedCalories: 1000)
		
		AccountView()
			.environmentObject(user)
	}
}
//Preview --------------------------------------------------


// Page component --------------------------------------------------------
struct settingsOption<Content: View>: View {
	
	@Environment(\.dismiss) private var dismiss
	
	var title : String
	var destination: Content
	
	var body: some View {
		NavigationLink(destination: self.destination, label: {
			
			Text(title)
				.foregroundStyle(.text)
			
			Spacer()
			
			Image(systemName: "arrow.right")
				.font(.system(size: 20))
				.foregroundStyle(Color(red: 120/255, green: 201/255, blue: 0))
		})
		.padding()
		.background(Color .gray.opacity(0.2))
		.clipShape(RoundedRectangle(cornerRadius: 10))
		
	}
}
