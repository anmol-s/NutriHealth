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
            
            List
            {
                    //TODO: Add daily intake item file and loop here
                    
                    //TODO: Test data Remove after adding above
                
                Group // Calories
                {
                    Text("Calories")
                }
                
                Group // Macronutrients
                {
                    Text("Total Fat (g)")
                    Text("Carbohydrates (g)")
                    Text("Protein (g)")
                }
                
                Group // Minerals
                {
                    Text("Calcium (mg)")
                    Text("Iron (mg)")
                    Text("Magnesium (mg)")
                    Text("Phosphorus (mg)")
                    Text("Potassium (mg)")
                    Text("Sodium (mg)")
                    Text("Zinc (mg)")
                }
                
                Group // Vitamins Pt1
                {
                    Text("Vitamin A (mcg RAE)")
                    Text("Vitamin E (mg AT)")
                    Text("Vitamin D (IU)")
                    Text("Vitamin C (mg)")
                    Text("Thiamin (mg)")
                    Text("Riboflavin (mg)")
                    Text("Niacin (mg)")
                    Text("Vitamin B-6 (mg)")
                    Text("Vitamin B-12 (mcg)")
                    Text("Choline (mg)")
                }
                Group // Vitamins Pt2
                {
                    Text("Vitamin K (mcg)")
                    Text("Folate (mcg DFE)")
                }
            }.font(.system(size: 15.0))
        }
    }
}

struct DailyIntakeColumn_Previews: PreviewProvider {
    static var previews: some View {
        DailyIntakeColumn(items: ["1", "2"])
    }
}
