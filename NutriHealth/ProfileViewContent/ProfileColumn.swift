//
//  ProfileColumn.swift
//  NutriHealth
//
//  Created by apple on 2/24/21.
//

import SwiftUI

struct ProfileColumn: View {
    var body: some View {
        List{
            GoalsColumnItem(goalName: "Age", goalValue: "21")
            GoalsColumnItem(goalName: "Weight", goalValue: "110 lbs")
            GoalsColumnItem(goalName: "Height", goalValue: "5 ft 7 in")
            GoalsColumnItem(goalName: "Active", goalValue: "Moderate")
            GoalsColumnItem(goalName: "Dietary Restrictions", goalValue: "Vegeterian")
            GoalsColumnItem(goalName: "Allergies", goalValue: "None")
        }
    }
}

struct ProfileColumn_Previews: PreviewProvider {
    static var previews: some View {
        ProfileColumn()
    }
}
