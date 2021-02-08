//
//  ContentView.swift
//  NutriHealth
//
//  Created by Owner on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    
    let Gray1 = Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 1.0)
    let Gray2 = Color(red: 0.91, green: 0.91, blue: 0.91, opacity: 1.0)
    
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            Logo()
            TextField("Email", text: $username)
                .padding()
                .background(Gray1)
                .cornerRadius(8.0)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
            SecureField("Password", text: $password)
                .padding()
                .background(Gray1)
                .cornerRadius(8.0)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Gray2, lineWidth: 1))
        
            Button(action: {print("Button Clicked")}) {
                LoginButtonText()
                .padding()
            }
        }
        .padding(20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
            
    }
}

struct Logo: View {
    var body: some View {
        Text("NutriHealth")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.bottom, 40.0)
    }
}

struct LoginButtonText: View {
    let Blue = Color(red: 0.18, green: 0.5, blue: 0.93, opacity: 1.0)
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 343, height: 51)
            .background(Blue)
            .cornerRadius(100.0)
    }
}
