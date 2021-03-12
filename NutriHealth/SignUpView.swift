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
                self.createNewUser()
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
    
    
    
    func createNewUser(){
        print("creating new user...")
        let user = PFUser()
        user.username = self.username
        user.password = self.password

        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
              let errorString = error.localizedDescription
              print(errorString)
            } else {
                print("Created user \(String(describing: user.username))")
                createPersonalModel(user: user)
            }
        }
    }
    
    func createPersonalModel(user: PFUser){
        print("Creating new personal model for \(user.username ?? "test")...")
        
        let height:Int = ((self.heightft as NSString).integerValue * 12) + (self.heightin as NSString).integerValue
        print("height (converted to inches): \(String(describing: height))")
        print("weight: \(self.weight)")
        print("gender: \(self.gender)")
        print("activity level: \(self.activityLevel)")
        print("fitness goals: \(self.fitnessGoals)")
        print("fitness goals: \(self.fitnessGoals)")
        
        let personalModel = PFObject(className: "PersonalModel")
        personalModel.setObject(user.username!, forKey: "username")
        personalModel.setObject(self.age, forKey: "age")
        personalModel.setObject(height, forKey: "height")
        personalModel.setObject((self.weight as NSString).integerValue, forKey: "weight")
        personalModel.setObject(self.gender, forKey: "gender")
        personalModel.setObject(self.activityLevel, forKey: "activityLevel")
        personalModel.setObject(self.fitnessGoals, forKey: "fitnessGoals")
        personalModel.setObject(user, forKey: "user")

        personalModel.saveInBackground{
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
              let errorString = error.localizedDescription
              print(errorString)
            } else {
                print("Personal model for \(String(describing: user.username)) created")
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
                TextField("0", text: $heightft)
                    .padding()
                    .frame(width: 100, height: 51)
                    .keyboardType(.numberPad)
                    .background(Gray1)
                    .cornerRadius(8.0)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
                    .padding([.leading, .trailing])
                Text("ft").padding()
                TextField("0", text: $heightin)
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
                TextField("0", text: $weight)
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
    var genders: [String] = ["male", "female"]
    var body: some View {
        Group{
            Text("Select Gender").padding(.leading)
            Picker("Gender", selection: $gender, content: {
                Text("Male").tag(genders[0])
                Text("Female").tag(genders[1])
            })
        }
    }
}

struct ActivityLevels: View {
    @Binding var activityLevel:String
    var levels: [String] = ["inactive", "somewhatActive", "active", "veryActive"]
    var body: some View {
        Group{
            Text("How active are you?").padding(.leading)
            Picker("Activity Level", selection: $activityLevel, content: {
                Text("Inactive").tag(levels[0])
                Text("Somewhat Active").tag(levels[1])
                Text("Active").tag(levels[2])
                Text("Very Active").tag(levels[3])
            })
        }
    }
}

struct FitnessGoals: View {
    @Binding var fitnessGoals:String
    var goals: [String] = ["loseWeightGainMuscle", "maintainWeightLoseFatGainMuscle", "maintainFitness", "gainWeightGainMuscle"]
    var body: some View {
        Group{
            Text("What are your Fitness Goals?").padding(.leading)
            Picker("Fitness Goals", selection: $fitnessGoals, content: {
                Text("Lose Weight & Gain Muscle").tag(goals[0])
                Text("Maintain Current Weight While Simultaneously Losing Fat & Building Muscle").tag(goals[1])
                Text("Maintain Fit Level").tag(goals[2])
                Text("Gain Weight & Gain Muscle").tag(goals[3])
            })
        }
    }
}
