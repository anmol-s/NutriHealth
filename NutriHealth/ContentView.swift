//
//  ContentView.swift
//  NutriHealth
//
//  Created by Owner on 2/6/21.
//

import SwiftUI
import Parse
//This is the Login Page
let Gray1 = Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 1.0)
let Gray2 = Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1.0)

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    
    @State var username: String = ""
    @State var password: String = ""
    @State var hidden: Bool = false
    @State var LoginFailed: Bool = false
    @State var LoginSucceeded: Bool = false
    
    var body: some View {
        VStack {
            Logo()
            EmailTextField(username: $username)
            PasswordTextField(password: $password, hidden: $hidden)
           
            //Feedback Message
            if LoginFailed{
                Text("Login Failed. Try Again.")
                    .padding()
                    .foregroundColor(.red)
            }
            if LoginSucceeded{
                Text("Successfully Logged in")
                    .padding()
                    .foregroundColor(.green)
            }
            
            //Login Button Action
            Button(action: {
                //self.createTestUser()
                //User Authentication
                PFUser.logInWithUsername(inBackground:self.username, password:self.password) {
                  (user: PFUser?, error: Error?) -> Void in
                  if user != nil {
                    // Do stuff after successful login.
                    self.LoginFailed = false
                    self.LoginSucceeded = true
                    viewRouter.currentPage = .page2
                  } else {
                    // The login failed. Check error to see why.
                    self.LoginFailed = true
                  }
                }
                
            }) {
                LoginButtonText()
                .padding()
            }
            HStack{
                Text("Don't have an account?")
                Button(action:{
                    viewRouter.currentPage = .page3
                }){
                    Text("Sign Up")
                }
            }
        }
        .padding(20.0)
        .onAppear(){
            print("view appeared")
            //uncomment the below line if test user NOT already created
            //self.createTestUser()
            //self.createTestPersonalModel()
        }
    }
    func createTestUser(){
        print("creating Test user...")
        let user = PFUser()
          user.username = "Test"
          user.password = "Test123"
          user.email = "email@example.com"

          user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
              let errorString = error.localizedDescription
              print(errorString)
                // Show the errorString somewhere and let the user try again.
            } else {
              // Hooray! Let them use the app now.
                print("Test user created")
            }
          }
    }
   
    /*
    func createTestPersonalModel(){
        print("creating Test personal model...")
        
        let personalModel = PFObject(className: "PersonalModel")
        personalModel.setObject("Test", forKey: "username")
        personalModel.setObject(100, forKey: "weight")
        personalModel.setObject(100, forKey: "height")
        personalModel.setObject("vitamin d", forKey: "deficiencies")
        personalModel.setObject("vegan", forKey: "dietaryRestrictions")
        personalModel.setObject(PFUser.current()!, forKey: "user")
        
        personalModel.saveInBackground{
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
              let errorString = error.localizedDescription
              print(errorString)
            } else {
                print("Test personal model created")
            }
        }
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewRouter: ViewRouter())
        }
            
    }
}

struct Logo: View {
    var body: some View {
        Image("dumbbell")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                    .scaledToFit()
                    .padding(.top, -150.0)
        
        Image("NutriHealthName")
                    .resizable()
                    .frame(width: 300.0, height: 50.0)
                    .scaledToFit()
                    .padding(.bottom, 50.0)
    }
}

struct LoginButtonText: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 343, height: 51)
            .background(Color.blue)
            .cornerRadius(100.0)
    }
}

struct EmailTextField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .frame(width: 360, height: 51)
            .background(Gray1)
            .cornerRadius(8.0)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
            .padding([.leading, .trailing])
    }
}

struct PasswordTextField: View {
    @Binding var password:String
    @Binding var hidden:Bool
    var body: some View {
        ZStack {
            HStack {
                if self.hidden {
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 360, height: 51)
                        .background(Gray1)
                        .cornerRadius(8.0)
                } else {
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 360, height: 51)
                        .background(Gray1)
                        .cornerRadius(8.0)
                }
            }.padding([.leading, .trailing]) // HStack
            Button(action: {self.hidden.toggle()})
            {
                Image(systemName: self.hidden ? "eye.fill": "eye.slash.fill").foregroundColor((self.hidden == true) ? Color.green : Color.secondary)
            }.offset(x: 150.0, y:0.0)
        } // ZStack
    }
}
