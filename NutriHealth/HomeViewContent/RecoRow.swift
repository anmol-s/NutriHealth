//
//  RecoRow.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI
//Refer for backend and frontend: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
struct RecoRow: View {
    var items: [String]
    var body: some View {
        VStack(alignment: .leading){
            Text("Recommendations")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    //TODO: Add reco item file and loop here
                    
                    //TODO: Test data Remove after adding above
                    Text("Reco1 ")
                    Text("Reco2 ")
                    Text("Reco3 ")
                    Text("Reco4 ")
                }.padding()
            }
            .frame(height: 185)
        }
    }
}

struct RecoRow_Previews: PreviewProvider {
    static var previews: some View {
        //TODO: add data from db here
        RecoRow(items: ["Reco1", "Reco2"])
    }
}
