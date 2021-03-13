//
//  DailyIntakeItems.swift
//  NutriHealth
//
//  Created by Owner on 3/10/21.
//

import SwiftUI

struct DailyIntakeItems: View
{
    var IntakeName: String
    var IntakeValue: String
    var IntakeRec: String
    
    var body: some View
    {
        VStack(alignment:.leading)
        {
            HStack
            {
                Text(IntakeName)
                    .font(.headline)
                    .fontWeight(.medium)
                Spacer()
                Text(IntakeValue)
                    .font(.headline)
            }
            
            HStack
            {
                Text("Recommended").font(.subheadline)
                                   .foregroundColor(.blue)
                Spacer()
                Text(IntakeRec)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }//.padding()
    }
}

struct DailyIntakeItems_Previews: PreviewProvider
{
    static var previews: some View
    {
        DailyIntakeItems(IntakeName: "Calories", IntakeValue: "5", IntakeRec: "2000")
    }
}

