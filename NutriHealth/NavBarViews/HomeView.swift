//
//  HomeView.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import SwiftUI
//This is the home page
struct HomeView: View {
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        UISegmentedControl.appearance().backgroundColor = UIColor.white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }

    var body: some View {
        VStack
        {
            Text("Home").font(.title)
            CalendarView()
            RecoRow(items: ["Reco1","Reco2"]).offset(y:-150)
            DailyIntakeColumn(items: ["1","2"]).offset(y:-150)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
