//
//  HomeView.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import SwiftUI

//This is the home page
struct HomeView: View {
    
    var body: some View {
        VStack{
            Text("// Insert Dates").font(.title)
            RecoRow(items: ["Reco1","Reco2"])
            DailyIntakeColumn(items: ["1","2"])
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
