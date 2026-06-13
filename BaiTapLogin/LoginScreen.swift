//
//  LoginScreen.swift
//  BaiTapLogin
//
//  Created by Van Tien on 1/6/26.
//
import SwiftUI
import Observation

enum Route: Hashable {
    case signUp
    case detail(User)
    case edit(User)
}

@Observable
class Router {
    var path: NavigationPath = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct LoginScreen: View {
    
    @State var router: Router = Router()
    @State var viewModel: ViewModel = .init()
    @State var userName: String = ""
    @State var passWord: String = ""
    @State var loginError: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Text("User")
                    .font(Font.largeTitle.weight(.bold))
                
                VStack {
                    VStack(alignment: .leading){
                        Text("Username:")
                            .font(.headline)
                            .fontWeight(.bold)
                            
                        TextField("", text: $userName, prompt: Text("Nhập username của bạn!"))
                            .padding(5)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white)
                                    .stroke(Color.gray,
                                            lineWidth: 1)
                            }
                    }
                    .padding()
                    
                    Divider()
                    
                    VStack (alignment: .leading){
                        Text("Password:")
                            .font(.headline)
                            .fontWeight(.bold)
                        TextField("", text: $passWord, prompt: Text("Nhập password của bạn!"))
                            .padding(5)
                            .background {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.white)
                                    .stroke(Color.gray,
                                            lineWidth: 1)
                            }
                    }
                    .padding()
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .stroke(Color.gray, lineWidth: 1)
                }
                .padding()
                
                
                Button {
                   let ketQuaDangNhap = viewModel.checkLogin(userName: userName, password: passWord)
                   if let thongTinUser = ketQuaDangNhap {
                       router.push(.detail(thongTinUser))
                   } else {
                       loginError = true
                    }
                } label: {
                    Text("LOGIN")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                }
                .padding(.horizontal)
                Button {
                    router.push(.signUp)
                } label: {
                    Text("SIGN UP")
                        .foregroundStyle(Color.white)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                }
                .padding(.horizontal)
            }
            .navigationTitle("LOGIN SCREEN")
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .signUp:
                    SignUpScreen(viewModel: viewModel)
                case .detail(let thongTinUser):
                    DetailUserScreen(viewModel: viewModel, user: thongTinUser)
                case .edit(let thongTinUser):
                    EditScreen(viewModel: viewModel, user: thongTinUser)
                }
            }
            .alert("Login failed", isPresented: $loginError) {
                Button("OK", role: .cancel){}
            } message: {
                Text("Email or password is incorrect")
            }
        }
        .environment(router)
    }
}

#Preview {
    LoginScreen()
}
