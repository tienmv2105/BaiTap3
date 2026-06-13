//
//  EditScreen.swift
//  BaiTapLogin
//
//  Created by Van Tien on 5/6/26.
//
import SwiftUI

struct EditScreen: View {
    @Environment(Router.self) var router
    @Environment(\.dismiss) var quayVe
    
    @State var viewModel: ViewModel
    @State var nameUser: String = ""
    @State var roleUser: String = ""
    @State var user: User
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Fullname user:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                TextField("\(user.username)", text: $nameUser)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                Text("Role:")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                TextField("\(user.role)", text: $roleUser)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            .padding()
            
            Button {
                viewModel.editUser(idUser: user.id, newName: nameUser, newRole: roleUser)
                quayVe()
            } label: {
                Text("Save edit")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(nameUser.isEmpty || roleUser.isEmpty ? Color.gray : Color.blue)
                    }
                    .padding()
            }
            // khoá ( điều kiện khoá)
            .disabled(nameUser.isEmpty || roleUser.isEmpty)
        }
        .navigationTitle(Text("Edit User"))
    }
}

#Preview {
    NavigationStack{
        EditScreen(viewModel:ViewModel(),
                   user: User(id: "1", username: "test", password: "test", fullname: "test", role: "Test", managerID: "Test"))
    }
    .environment(Router())
}
