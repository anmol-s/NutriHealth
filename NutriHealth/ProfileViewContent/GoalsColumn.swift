//
//  GoalsColumn.swift
//  NutriHealth
//
//  Created by apple on 2/24/21.
//

import SwiftUI
import Parse

struct GoalsColumn: View {
    @State var weight:Int = 0
    @State var calories:Double = 0.0
    @State var FitnessGoal:String = ""
    var body: some View {
        List{
            GoalsColumnItem(goalName: "Fitness Goal", goalValue: FitnessGoal)
            GoalsColumnItem(goalName: "Weight", goalValue: "\(weight) lbs")
            GoalsColumnItem(goalName: "Calories", goalValue: "\(calories)")
            
        }
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
                        self.weight = object["weight"] as! Int
                        self.FitnessGoal = object["fitnessGoals"] as! String
                        self.calories = object["recommendedCalories"] as! Double
                    }
                }
            }
        }
    }
}

struct GoalsColumn_Previews: PreviewProvider {
    static var previews: some View {
        GoalsColumn()
    }
}
