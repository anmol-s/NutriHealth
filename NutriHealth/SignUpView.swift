//
//  SignUpView.swift
//  NutriHealth
//
//  Created by apple on 3/10/21.
//

import SwiftUI
import Parse
//This is the Sign up page

struct SignUpView: View {
    @StateObject var viewRouter = ViewRouter()
    
    @State var username: String = ""
    @State var password: String = ""
    @State var heightft: String = ""
    @State var heightin: String = ""
    @State var weight: String = ""
    @State var hidden: Bool = false
    @State var age:String = ""
    @State var gender: String = ""
    @State var activityLevel: String = ""
    @State var fitnessGoals: String = ""
    
    var body: some View {
        VStack{
            Header()
            ScrollView(.vertical){
                VStack(alignment:.leading){
                    Username(username: $username)
                    Password(password: $password, hidden: $hidden)
                    Age(age: $age)
                    Height(heightft: $heightft, heightin: $heightin)
                    Weight(weight: $weight)
                    Gender(gender: $gender)
                    ActivityLevels(activityLevel: $activityLevel)
                    FitnessGoals(fitnessGoals: $fitnessGoals)
                
                }
            }
            //SignUp button
            Button(action: {
                //self.createTestUser()
                viewRouter.currentPage = .page2
                
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 360, height: 51)
                    .background(Color.blue)
                    .cornerRadius(100.0)
                .padding()
            }
        }
        
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewRouter: ViewRouter())
    }
}

struct Username: View {
    @Binding var username:String
    var body: some View {
        Group{
            Text("Enter Username").padding(.leading)
            TextField("Username", text: $username)
                .padding()
                .frame(width: 360, height: 51)
                .background(Gray1)
                .cornerRadius(8.0)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                .padding([.leading, .trailing])
        }
    }
}

struct Header: View {
    var body: some View {
        HStack(alignment: .top){
            Text("Let's create an account for you.").font(.largeTitle).fontWeight(.semibold).padding()
            Spacer()
            Image("dumbbell")
                .resizable()
                .frame(width: 100.0, height: 100.0)
                .scaledToFit()
                .padding()
        }
    }
}

struct Password: View {
    @Binding var password:String
    @Binding var hidden:Bool
    var body: some View {
        Group{
            Text("Create Password").padding(.leading)
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
}

struct Height: View {
    @Binding var heightft:String
    @Binding var heightin:String
    var body: some View {
        Group{
            Text("What is your height?").padding(.leading)
            HStack{
                TextField("0", value: $heightft, formatter:NumberFormatter())
                    .padding()
                    .frame(width: 100, height: 51)
                    .keyboardType(.numberPad)
                    .background(Gray1)
                    .cornerRadius(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                    .padding([.leading, .trailing])
                Text("ft").padding()
                TextField("0", value: $heightin, formatter:NumberFormatter())
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 100, height: 51)
                    .background(Gray1)
                    .cornerRadius(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                    .padding([.leading, .trailing])
                Text("in").padding()
            }
        }
    }
}

struct Weight: View {
    @Binding var weight: String
    var body: some View {
        Group{
            Text("How much do you weigh?").padding(.leading)
            HStack{
                TextField("0", value: $weight, formatter:NumberFormatter())
                    .padding()
                    .frame(width: 300, height: 51)
                    .keyboardType(.numberPad)
                    .background(Gray1)
                    .cornerRadius(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                    .padding([.leading, .trailing])
                Text("lb").padding()
            }
        }
    }
}

struct Age: View {
    @Binding var age: String
    var body: some View {
        Group{
            Text("How old are you?").padding(.leading)
            TextField("Age", text: $age)
                .padding()
                .frame(width: 360, height: 51)
                .keyboardType(.numberPad)
                .background(Gray1)
                .cornerRadius(8.0)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                .padding([.leading, .trailing])
        }
    }
}

struct Gender: View {
    @Binding var gender: String
    var body: some View {
        Group{
            Text("Select Gender").padding(.leading)
            Picker("Gender", selection: $gender, content: {
                Text("Male").tag(1)
                Text("Female").tag(2)
                Text("Non-Binary").tag(3)
            })
        }
    }
}

struct ActivityLevels: View {
    @Binding var activityLevel:String
    var body: some View {
        Group{
            Text("How active are you?").padding(.leading)
            Picker("Activity Level", selection: $activityLevel, content: {
                Text("Inactive").tag(1)
                Text("Somewhat Active").tag(2)
                Text("Active").tag(3)
                Text("Very Active").tag(4)
            })
        }
    }
}

struct FitnessGoals: View {
    @Binding var fitnessGoals:String
    var body: some View {
        Group{
            Text("What are your Fitness Goals?").padding(.leading)
            Picker("Fitness Goals", selection: $fitnessGoals, content: {
                Text("Lose Weight & Gain Muscle").tag(1)
                Text("Maintain Current Weight While Simultaneously Losing Fat & Building Muscle").tag(2)
                Text("Maintain Fit Level").tag(3)
                Text("Gain Weight & Gain Muscle").tag(4)
            })
        }
    }
}
