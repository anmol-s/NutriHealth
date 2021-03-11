//
//  File.swift
//  NutriHealth
//
//  Created by Owner on 3/10/21.
//

import SwiftUI

struct DailyIntakeItems: View
{
    var IntakeName: String
    var IntakeValue: String
    
    var body: some View
    {
        HStack
        {
            Text(IntakeName)
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
            Text(IntakeValue)
                .font(.headline)
            
            
        }.padding()
    }
}

struct DailyIntakeItems_Previews: PreviewProvider
{
    static var previews: some View
    {
        DailyIntakeItems(IntakeName: "Calories", IntakeValue: "5")
    }
}

