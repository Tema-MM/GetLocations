//import SwiftUI
//
////struct LoginView: View {
////    var body: some View {
////        VStack(spacing: 20) {
////            Text("Welcome Back")
////                .font(.largeTitle)
////                .fontWeight(.bold)
////            
////            TextField("Email", text: .constant(""))
////                .padding()
////                .background(Color(.secondarySystemBackground))
////                .cornerRadius(8)
////                .keyboardType(.emailAddress)
////                .autocapitalization(.none)
////            
////            SecureField("Password", text: .constant(""))
////                .padding()
////                .background(Color(.secondarySystemBackground))
////                .cornerRadius(8)
////            
////            Button(action: {
////                // Handle regular login
////            }) {
////                Text("Log In")
////                    .foregroundColor(.white)
////                    .frame(maxWidth: .infinity)
////                    .padding()
////                    .background(Color.blue)
////                    .cornerRadius(8)
////            }
////            
////            HStack {
////                Text("or")
////                    .font(.subheadline)
////                    .foregroundColor(.gray)
////                
////                Divider()
////                    .frame(width: 1, height: 24)
////                    .background(Color.gray)
////                
////                Text("Sign in with")
////                    .font(.subheadline)
////                    .foregroundColor(.gray)
////            }
////            .padding(.vertical)
////            
////            Button(action: {
////                // Handle Google Sign-In
////            }) {
////                HStack {
////                    Image(systemName: "g.circle")
////                        .font(.title)
////                    Text("Sign in with Google")
////                        .foregroundColor(.black)
////                        .font(.headline)
////                }
////                .frame(maxWidth: .infinity)
////                .padding()
////                .background(Color.white)
////                .overlay(
////                    RoundedRectangle(cornerRadius: 8)
////                        .stroke(Color.gray, lineWidth: 1)
////                )
////                .cornerRadius(8)
////            }
////            
////            Spacer()
////        }
////        .padding()
////    }
////}
////
////struct LoginView_Previews: PreviewProvider {
////    static var previews: some View {
////        LoginView()
////    }
////}
//
////struct LoginView: View {
////    @State private var email = ""
////    @State private var password = ""
////    
////    var body: some View {
////        ZStack {
////            Color.white
////            
////            RoundedRectangle(cornerRadius: 30, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
////                .foregroundStyle(.linearGradient(colors: [.white, .blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
////            
////            VStack(spacing: 20) {
////                Text("Welcome")
////                    .foregroundColor(.white)
////                    .font(.system(size: 40, weight: .bold))
////                    .offset(x: -70, y: -100)
////                
////                TextField("Email", text: $email)
////                    .foregroundColor(.white)
////                    .textFieldStyle(.plain)
////                    .placeholder(when: email.isEmpty) {
////                        Text("Email")
////                            .foregroundColor(.white)
////                            .bold()
////                    }
////                
////                Rectangle()
////                    .frame(width: 350, height: 1)
////                    .foregroundColor(.white)
////                
////                SecureField("Password", text: $password)
////                    .foregroundColor(.white)
////                    .textFieldStyle(.plain)
////                    .placeholder(when: password.isEmpty) {
////                        Text("Password")
////                            .foregroundColor(.white)
////                            .bold()
////                    }
////                
////                Rectangle()
////                    .frame(width: 350, height: 1)
////                    .foregroundColor(.white)
////                
////            }
////            .frame(width: 350)
////        }
////        .ignoresSafeArea()
////    }
////}
////
////#Preview {
////    LoginView()
////}
////
////
////extension View {
////    func placeholder<Content: View>(
////        when shouldShow: Bool,
////        alignment: Alignment = .leading,
////        @ViewBuilder placeholder: () -> Content) -> some View {
////            ZStack(alignment: alignment) {
////                placeholder().opacity(shouldShow ? 1 : 0)
////                self
////            }
////        }
////}
//
//
////import SwiftUI
//import Firebase
//
//struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
//    
//    var body: some View {
//        ZStack {
//            Color.white
//                .ignoresSafeArea()
//            
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .foregroundStyle(.linearGradient(colors: [.white, .blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .ignoresSafeArea()
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
//                // Regular Login Button
//                Button(action: {
//                    // Handle regular login
//                }) {
//                    Text("Log In")
//                        .foregroundColor(.blue)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(8)
//                }
//                .frame(width: 350)
//                
//                // Sign in with Google Button
//                Button(action: {
//                    // Handle Google Sign-In
//                }) {
//                    HStack {
//                        Image(systemName: "g.circle")
//                            .font(.title)
//                        Text("Sign in with Google")
//                            .foregroundColor(.white)
//                            .font(.headline)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.gray.opacity(0.2))
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.white, lineWidth: 1)
//                    )
//                    .cornerRadius(8)
//                }
//                .frame(width: 350)
//                .padding(.top, 20)
//                
//            }
//            .frame(width: 350)
//        }
//        .ignoresSafeArea()
//    }
//    
//    func register() {
//        Auth.R
//    }
//}
//
//// Extension to add placeholder functionality to TextField and SecureField
//extension View {
//    func placeholder<Content: View>(
//        when shouldShow: Bool,
//        alignment: Alignment = .leading,
//        @ViewBuilder placeholder: () -> Content) -> some View {
//            ZStack(alignment: alignment) {
//                placeholder().opacity(shouldShow ? 1 : 0)
//                self
//            }
//        }
//}
//
//#Preview {
//    LoginView()
//}

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isLoggedIn = false // State variable to track login status
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.white, .blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea()
                
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
                    
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isLoggedIn // Automatically navigates when logged in
                    ) {
                        EmptyView() // Empty view to link the navigation
                    }
                    
                    Button(action: {
                        login()
                    }) {
                        Text("Log In")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                    .frame(width: 350)
                    .padding(.top, 20)
                }
                .frame(width: 350)
                .padding(.top, 20)
            }
            .ignoresSafeArea()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = nil
                isLoggedIn = true // Set to true to navigate to ContentView
            }
        }
    }
}

#Preview {
    LoginView()
}
