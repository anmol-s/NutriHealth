//
//  HomeView.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import SwiftUI
//This is the home page
struct HomeView: View {
    @StateObject var viewRouter = ViewRouter()
    var body: some View {
        Text("Hello Page")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
