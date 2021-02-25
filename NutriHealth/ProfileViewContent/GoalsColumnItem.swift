//
//  GoalsColumnItem.swift
//  NutriHealth
//
//  Created by apple on 2/24/21.
//

import SwiftUI

struct GoalsColumnItem: View {
    var goalName: String
    var goalValue: String
    
    var body: some View {
        HStack{
            Text(goalName)
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
            Text(goalValue)
                .font(.headline)
            
            
        }.padding()
    }
}

struct GoalsColumnItem_Previews: PreviewProvider {
    static var previews: some View {
        GoalsColumnItem(goalName: "Weight", goalValue: "110 lbs")
    }
}
