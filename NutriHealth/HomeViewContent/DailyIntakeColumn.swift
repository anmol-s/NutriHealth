//
//  DailyIntakeColumn.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI
import Parse
//Refer for backend and frontend: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces

struct DailyIntakeColumn: View
{
    @State var CalorieIntakeRec: Double = 0.0
    @State var ProteinIntakeRec: Int = 0
    @State var CarbIntakeRec: Double = 0.0
    @State var FatIntakeRec: Int = 0
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 25)!]
    }
    
    var body: some View
    {
       VStack(alignment: .leading)
        {
            Text("Daily Calories & Nutrition")
                .font(.custom("AppleSDGothicNeo-Bold", size: 25))
                .padding(.leading, 15)
                .padding(.top, 5)
            List
            {
                Group
                {
                    DailyIntakeItems(IntakeName: "Calories", IntakeValue: "11", IntakeRec: "\(CalorieIntakeRec)")
                }
                
                Section(header: Text("Macronutrients"))
                {
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Total Fat (g)", IntakeValue: "22", IntakeRec: "\(FatIntakeRec)")
                        DailyIntakeItems(IntakeName: "Carbohydrates (g)", IntakeValue: "33", IntakeRec: "\(CarbIntakeRec)")
                        DailyIntakeItems(IntakeName: "Protein", IntakeValue: "44", IntakeRec: "\(ProteinIntakeRec)")
                    }
                }
                   
                Section(header: Text("Minerals"))
                {
                    Group
                    {
                    DailyIntakeItems(IntakeName: "Calcium (mg)", IntakeValue: "55", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Iron (mg)", IntakeValue: "66", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Magnesium (mg)", IntakeValue: "77", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Phosphorus (mg)", IntakeValue: "88", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Potassium (mg)", IntakeValue: "99", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Sodium (mg)", IntakeValue: "100", IntakeRec: "2000")
                    DailyIntakeItems(IntakeName: "Zinc (mg)", IntakeValue: "110", IntakeRec: "2000")
                    }
                }
    
                Section(header: Text("Vitamins"))
                {
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Vitamin A (mcg RAE)", IntakeValue: "120", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Vitamin E (mg AT)", IntakeValue: "130", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Vitamin D (IU)", IntakeValue: "140", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Vitamin C (mg)", IntakeValue: "150", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Thiamin (mg)", IntakeValue: "160", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Riboflavin (mg)", IntakeValue: "170", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Niacin (mg)", IntakeValue: "180", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Vitamin B-6 (mg)", IntakeValue: "190", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Vitamin B-12 (mcg)", IntakeValue: "200", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Choline (mg)", IntakeValue: "210", IntakeRec: "2000")
                    }
    
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Vitamin K (mcg)", IntakeValue: "220", IntakeRec: "2000")
                        DailyIntakeItems(IntakeName: "Folate (mcg DFE)", IntakeValue: "230", IntakeRec: "2000")
                    }
                }
            }.frame(maxHeight: .infinity)//.navigationTitle("Daily Calories & Nutrition") // list
        } // navigation view
        .onAppear(){
            let query = PFQuery(className:"PersonalModel")
            query.whereKey("user", equalTo:PFUser.current())
            query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
                if let error = error {
                    // Log details of the failure
                    print(error.localizedDescription)
                } else if let objects = objects {
                    // The find succeeded.
                    print("Successfully retrieved \(objects.count) scores.")
                    // Do something with the found objects
                    for object in objects {
                        print(object.objectId as Any)
                        self.CalorieIntakeRec = object["recommendedCalories"] as! Double
                        self.CarbIntakeRec = object["recommendedCarbs"] as! Double
                        self.ProteinIntakeRec = object["recommendedProtein"] as! Int
                        self.FatIntakeRec = object["recommendedFat"] as! Int
                    }
                }
            }
        }
    }
}

struct DailyIntakeColumn_Previews: PreviewProvider
{
    static var previews: some View
    {
        DailyIntakeColumn()
    }
}


//struct DailyIntakeColumn: View {
//    var items: [String]
//    var body: some View
//    {
//            VStack(alignment: .leading)
//            {
//                Text("Daily Intake Percentage")
//                    .font(.headline)
//                    .padding(.leading, 15)
//                    .padding(.top, 5)
//
//                List
//                {
//                        //TODO: Add daily intake item file and loop here
//
//                        //TODO: Test data Remove after adding above
//
//                    Group // Calories
//                    {
//                        Text("Calories")
//                    }
//
//                    Group // Macronutrients
//                    {
//                        Text("Total Fat (g)")
//                        Text("Carbohydrates (g)")
//                        Text("Protein (g)")
//                    }
//
//                    Group // Minerals
//                    {
//                        Text("Calcium (mg)")
//                        Text("Iron (mg)")
//                        Text("Magnesium (mg)")
//                        Text("Phosphorus (mg)")
//                        Text("Potassium (mg)")
//                        Text("Sodium (mg)")
//                        Text("Zinc (mg)")
//                    }
//
//                    Group // Vitamins Pt1
//                    {
//                        Text("Vitamin A (mcg RAE)")
//                        Text("Vitamin E (mg AT)")
//                        Text("Vitamin D (IU)")
//                        Text("Vitamin C (mg)")
//                        Text("Thiamin (mg)")
//                        Text("Riboflavin (mg)")
//                        Text("Niacin (mg)")
//                        Text("Vitamin B-6 (mg)")
//                        Text("Vitamin B-12 (mcg)")
//                        Text("Choline (mg)")
//                    }
//                    Group // Vitamins Pt2
//                    {
//                        Text("Vitamin K (mcg)")
//                        Text("Folate (mcg DFE)")
//                    }
//
//                }.font(.system(size: 15.0))
//            }
//    }
//}
//
//struct DailyIntakeColumn_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyIntakeColumn(items: ["1", "2"])
//    }
//}


