//
//  DailyIntakeColumn.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI
//Refer for backend and frontend: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
struct DailyIntakeColumn: View {
    var items: [String]
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily Intake Percentage")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            List{
                    //TODO: Add daily intake item file and loop here
                    
                    //TODO: Test data Remove after adding above
                    Text("Calories")
                    Text("Carbohydrates")
                    Text("Protein")
                    Text("Fat")

                }
        }
    }
}

struct DailyIntakeColumn_Previews: PreviewProvider {
    static var previews: some View {
        DailyIntakeColumn(items: ["1", "2"])
    }
}
