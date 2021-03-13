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
                    DailyIntakeItems(IntakeName: "Calories", IntakeValue: "0", IntakeRec: "\(CalorieIntakeRec)")
                }
                
                Section(header: Text("Macronutrients"))
                {
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Total Fat (g)", IntakeValue: "0", IntakeRec: "\(FatIntakeRec)")
                        DailyIntakeItems(IntakeName: "Carbohydrates (g)", IntakeValue: "0", IntakeRec: "\(CarbIntakeRec)")
                        DailyIntakeItems(IntakeName: "Protein", IntakeValue: "0", IntakeRec: "\(ProteinIntakeRec)")
                    }
                }
                   
                Section(header: Text("Minerals"))
                {
                    Group
                    {
                    DailyIntakeItems(IntakeName: "Calcium (mg)", IntakeValue: "0", IntakeRec: "1000")
                    DailyIntakeItems(IntakeName: "Iron (mg)", IntakeValue: "0", IntakeRec: "8")
                    DailyIntakeItems(IntakeName: "Magnesium (mg)", IntakeValue: "0", IntakeRec: "400")
                    DailyIntakeItems(IntakeName: "Phosphorus (mg)", IntakeValue: "0", IntakeRec: "700")
                    DailyIntakeItems(IntakeName: "Potassium (mg)", IntakeValue: "0", IntakeRec: "3400")
                    DailyIntakeItems(IntakeName: "Sodium (mg)", IntakeValue: "0", IntakeRec: "2300")
                    DailyIntakeItems(IntakeName: "Zinc (mg)", IntakeValue: "0", IntakeRec: "11")
                    }
                }
    
                Section(header: Text("Vitamins"))
                {
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Vitamin A (mcg RAE)", IntakeValue: "0", IntakeRec: "900")
                        DailyIntakeItems(IntakeName: "Vitamin E (mg AT)", IntakeValue: "0", IntakeRec: "15")
                        DailyIntakeItems(IntakeName: "Vitamin D (IU)", IntakeValue: "0", IntakeRec: "600")
                        DailyIntakeItems(IntakeName: "Vitamin C (mg)", IntakeValue: "0", IntakeRec: "90")
                        DailyIntakeItems(IntakeName: "Thiamin (mg)", IntakeValue: "0", IntakeRec: "1.2")
                        DailyIntakeItems(IntakeName: "Riboflavin (mg)", IntakeValue: "0", IntakeRec: "1.3")
                        DailyIntakeItems(IntakeName: "Niacin (mg)", IntakeValue: "0", IntakeRec: "16")
                        DailyIntakeItems(IntakeName: "Vitamin B-6 (mg)", IntakeValue: "0", IntakeRec: "1.3")
                        DailyIntakeItems(IntakeName: "Vitamin B-12 (mcg)", IntakeValue: "0", IntakeRec: "2.4")
                        DailyIntakeItems(IntakeName: "Choline (mg)", IntakeValue: "0", IntakeRec: "550")
                    }
    
                    Group
                    {
                        DailyIntakeItems(IntakeName: "Vitamin K (mcg)", IntakeValue: "0", IntakeRec: "120")
                        DailyIntakeItems(IntakeName: "Folate (mcg DFE)", IntakeValue: "0", IntakeRec: "400")
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


