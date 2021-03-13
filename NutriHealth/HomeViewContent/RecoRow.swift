//
//  RecoRow.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI
//Refer for backend and frontend: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces


struct RecoRow: View
{
    init()
    {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "AppleSDGothicNeo-Bold", size: 25)!]
    }
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("General Recommendations")
                .font(.custom("AppleSDGothicNeo-Bold", size: 25))
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                HStack(alignment: .top, spacing: 0)
                {
                    RecoItems(RecommendationText: "70% Whole & Nutrient-Rich Foods")
                    Spacer()
                    RecoItems(RecommendationText: "15% Minimally Processed & Nutrient-Rich Foods")
                    Spacer()
                    RecoItems(RecommendationText: "15% Processed & Junk Foods")
                    Spacer()
                }
            }
        } // list
    } // navigation view
}

struct RecoRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecoRow()
    }
}
