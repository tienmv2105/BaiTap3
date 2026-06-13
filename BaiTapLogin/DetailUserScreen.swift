//
//  DetailUserScreen.swift
//  BaiTapLogin
//
//  Created by Van Tien on 2/6/26.
//
import SwiftUI

struct DetailUserScreen: View {
    @Environment(Router.self) var router
    
    @State var viewModel: ViewModel
    var user: User
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .padding(.bottom, 10)
                    Text("\(user.fullname)")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("\(user.role)")
                        .font(.system(size: 30, weight: .bold))
                }
                .padding(.vertical, 10)
                
                Button{
                    
                } label: {
                    Text("Add new user")
                }
                .buttonStyle(.glassProminent)
                
                List {
                    ForEach(viewModel.listUserByManagerID(tenCuaSep: user.username)) { user in
                        HStack{
                            Text("\(user.fullname)")
                            Divider()
                            Text("\(user.role)")
                            Spacer()
                            Button{
                                router.push(.edit(user))
                            } label: {
                                Text("Edit")
                            }
                            .buttonStyle(.glassProminent)
                        }
                    }
                    .onDelete { index in
                        viewModel.deleteUser(index: index)
                    }
                }
                Spacer()
                Button{
                    router.popToRoot()
                } label: {
                    Text("Logout")
                }
                .buttonStyle(.glassProminent)
            }
        }
        .navigationTitle(Text("Profile"))
    }
}

#Preview {
    NavigationStack {
        DetailUserScreen(viewModel: ViewModel(), user: User(username: "", password: "test", fullname: "TestFullName", role: "TestRole", managerID: "boss 1"))
    }
    .environment(Router())
}
