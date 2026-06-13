//
//  AddScreen.swift
//  BaiTapLogin
//
//  Created by Van Tien on 13/6/26.
//

import SwiftUI
struct AddScreen: View {
    @Environment(Router.self) var router
    @Environment(\.dismiss) var quayVe

    
    @State var viewModel: ViewModel
    @State var username: String = ""
    @State var password: String = ""
    @State var role: String = ""
    @State var fullName: String = ""
    @State var isUsernameExist: Bool = false
    var user: User
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Username:")
                TextField("Username", text: $username)
                    .background{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                Text("Password:")
                TextField("Password", text: $password)
                    .background{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                Text("Fullname:")
                TextField("Fullname", text: $fullName)
                    .background{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                Text("Role:")
                TextField("Role", text: $role)
                    .background{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            .padding()
            Text("\(user.username)")
            
            Button{
                viewModel.addUser(userName: username, password: password, fullName: fullName, role: role, managerID: user.username)
                quayVe()
            } label: {
                Text("Add")
            }
            .buttonStyle(.glassProminent)
        }
        .navigationTitle(Text("Add User"))
        }
    
}
#Preview {
    NavigationStack{
        AddScreen(viewModel: ViewModel(), user: User(username: "TestUsername", password: "Test", fullname: "Test", role: "TestRole", managerID: "TestManagerID"))
    }
    .environment(Router())
}
