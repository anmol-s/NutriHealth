//
//  FoodView.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI

struct FoodView: View {
    @State var selectedView = 0
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        UISegmentedControl.appearance().backgroundColor = UIColor.white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        VStack{
            Rectangle()
                .frame(height: 80)
                .foregroundColor(.blue)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            FoodPageTitle().offset(y:-41)
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView()
    }
}

struct FoodPageTitle: View {
    var body: some View {
        Text("Food")
            .font(.system(size: 18)).fontWeight(.semibold)
    }
}

