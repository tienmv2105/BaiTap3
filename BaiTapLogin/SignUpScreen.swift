//
//  SignUpScreen.swift
//  BaiTapLogin
//
//  Created by Van Tien on 1/6/26.
//

import SwiftUI

struct SignUpScreen: View {
    
    @Environment(Router.self) var router
    @Environment(\.dismiss) var quayVe
    
    @State var viewModel: ViewModel
    @State var username: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var confirmPassword: String = ""
    @State var role: String = ""
    @State var managerID: String = ""
    @State var isConfirmPassword: Bool = false
    @State var isUsernameExist: Bool = false
    
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Username:")
            
            TextField("", text: $username)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            
            Text("Password:")
            SecureField("", text: $password)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            Text("Confirm Password:")
            SecureField("", text: $confirmPassword)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            Text("Fullname:")
            TextField("", text: $fullname)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            
            Text("Role:")
            TextField("", text: $role)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
            Text("Manager ID:")
            
            TextField("", text: $managerID)
                .background {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
        }
        .padding()
        .padding(.vertical)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .stroke(Color.gray, lineWidth: 1)
        }
        .padding()
        
        Button{
            if viewModel.usernameExist(userName: username) {
                isUsernameExist = true
            }
            
            if confirmPassword != password {
                isConfirmPassword = true
            }
            
            if password == confirmPassword && viewModel.usernameExist(userName: username) == false {
                viewModel.createUser(userName: username, password: password, fullName: fullname, role: role, managerID: managerID)
            }
        } label: {
            Text("Sign Up")
                .foregroundStyle(Color.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
        }
        .padding()
        .navigationTitle(Text("Sign Up"))
        .alert("Confirm Password is not same", isPresented: $isConfirmPassword) {
            Button("OK", role: .cancel){}
        } message: {
            Text("Confirm password is not same, please try again")
        }
        .alert("Username is exist", isPresented: $isUsernameExist) {
            Button("OK", role: .cancel){}
        } message: {
            Text("Username is exist, please try another username")
        }
    }
}

#Preview {
    NavigationStack {
        SignUpScreen(viewModel: ViewModel())
    }
    .environment(Router())
}
