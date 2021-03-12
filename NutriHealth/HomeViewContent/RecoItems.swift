//
//  RecoItems.swift
//  NutriHealth
//
//  Created by Owner on 3/12/21.
//

import SwiftUI

struct RecoItems: View
{
    var RecommendationText: String
    
    var body: some View
    {
        ScrollView(.horizontal, showsIndicators: false)
        {
            HStack(alignment: .top, spacing: 0)
            {
                Text(RecommendationText)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(width: 155, height: 79)
                    .font(.system(size: 13.0))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
            }
        }
    }
}

struct RecoItems_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecoItems(RecommendationText: "15% Minimally Processed & Nutrient-Rich Foods")
    }
}
