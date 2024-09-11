import SwiftUI
import Firebase
import FirebaseAuth

//struct SignInRegisterView: View {
//    @State private var email = ""
//    @State private var password = ""
//    
//    var body: some View {
//        ZStack {
//            Color.white
//            
//            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
//                .foregroundStyle(.linearGradient(colors: [.white, .blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
//            
//            VStack(spacing: 20) {
//                Text("Welcome")
//                    .foregroundColor(.white)
//                    .font(.system(size: 40, weight: .bold))
//                    .offset(x: -70, y: -100)
//                
//                TextField("Email", text: $email)
//                    .foregroundColor(.white)
//                    .textFieldStyle(.plain)
//                    .placeholder(when: email.isEmpty) {
//                        Text("Email")
//                            .foregroundColor(.white)
//                            .bold()
//                    }
//                
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//                
//                SecureField("Password", text: $password)
//                    .foregroundColor(.white)
//                    .textFieldStyle(.plain)
//                    .placeholder(when: password.isEmpty) {
//                        Text("Password")
//                            .foregroundColor(.white)
//                            .bold()
//                    }
//                
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//                
//                Button {
//                    // sign up
//                    register()
//                } label: {
//                    Text("Sign up")
//                        .bold()
//                        .frame(width: 200, height: 40)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
//                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
//                        )
//                        .foregroundColor(.white)
//                }
//                .padding(.top)
//                .offset(y: 100)
//             
//                Button {
//                    // login
//                    login()
//                } label: {
//                    Text("Already have an account? login")
//                        .bold()
//                        .foregroundColor(.white)
//                }
//                .padding(.top)
//                .offset(y: 110)
//                
//            }
//            .frame(width: 350)
//        }
//        .ignoresSafeArea()
//    }
//    
//    func login() {
//        Auth.auth().signIn(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//    
//    func register() {
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//}

struct SignInRegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var userIsLoggedIn = false
    @State private var showLoginView = false
    
    var body: some View {
        if userIsLoggedIn {
            // go somewhere
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color.white

            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.white, .blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))

            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
                    .offset(x: -70, y: -100)

                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }

                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }

                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.top)
                }

                Button {
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 100)

                Button {
//                    login()
                    showLoginView = true
                } label: {
                    Text("Already have an account? login")
                        .bold()
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $showLoginView) {
                    LoginView() // Present the LoginView
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = nil
                // Navigate to next screen
            }
        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = nil
                // Navigate to next screen
            }
        }
    }
}


#Preview {
    SignInRegisterView()
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
