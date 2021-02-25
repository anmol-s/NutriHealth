//
//  GoalsColumn.swift
//  NutriHealth
//
//  Created by apple on 2/24/21.
//

import SwiftUI

struct GoalsColumn: View {
    var body: some View {
        List{
            GoalsColumnItem(goalName: "Weight", goalValue: "120 lbs")
            GoalsColumnItem(goalName: "Calories", goalValue: "2300")
            GoalsColumnItem(goalName: "Nutrients", goalValue: "Vitamin D, Protein")
        }
    }
}

struct GoalsColumn_Previews: PreviewProvider {
    static var previews: some View {
        GoalsColumn()
    }
}
