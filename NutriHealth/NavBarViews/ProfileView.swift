//
//  ProfileView.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedView = 0
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        UISegmentedControl.appearance().backgroundColor = UIColor.white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(height: 250)
                .foregroundColor(.blue)
            profileImage().offset(y: -130).padding(.bottom, -150)
            profileName()
            MantraText()
            
            ViewSegment(selectedView: $selectedView)
            
            if(selectedView == 0){
                GoalsColumn()
            }
            else{
                ProfileColumn()
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct profileImage: View {
    var body: some View {
        Image("Ellipse 6")
            .resizable()
            .frame(width: 200, height: 200)
                .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
    }
}

struct profileName: View {
    var body: some View {
        Text("Victoria Robertson")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 0)
    }
}

struct MantraText: View {
    var body: some View {
        Text("I am becoming stronger and fitter everyday")
            .font(.subheadline)
            .fontWeight(.medium)
    }
}

struct ViewSegment: View {
    @Binding var selectedView: Int
    var body: some View {
        Picker(selection: $selectedView, label: Text("Picker"), content: {
            Text("Goals").tag(0)
            Text("Profile").tag(1)
        }).pickerStyle(SegmentedPickerStyle())
        .cornerRadius(100)
        .padding()
    }
}
