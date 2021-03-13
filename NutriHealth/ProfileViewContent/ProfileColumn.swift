//
//  ProfileColumn.swift
//  NutriHealth
//
//  Created by apple on 2/24/21.
//

import SwiftUI
import Parse

struct ProfileColumn: View {
    @State var age:String = ""
    @State var gender:String = ""
    @State var weight:Int = 0
    @State var height:Int = 0
    @State var activity: String = ""
    
    var body: some View {
        List{
            GoalsColumnItem(goalName: "Age", goalValue: age)
            GoalsColumnItem(goalName: "Gender", goalValue: gender)
            GoalsColumnItem(goalName: "Weight", goalValue: "\(weight) lbs")
            GoalsColumnItem(goalName: "Height", goalValue: "\(height) in")
            GoalsColumnItem(goalName: "Activity Level", goalValue: activity)
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
                        self.age = object["age"] as! String
                        self.gender = object["gender"] as! String
                        self.weight = object["weight"] as! Int
                        self.height = object["height"] as! Int
                        self.activity = object["activityLevel"] as! String
                    }
                }
            }
        }
    }
}

struct ProfileColumn_Previews: PreviewProvider {
    static var previews: some View {
        ProfileColumn()
    }
}
