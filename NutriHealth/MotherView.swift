//
//  MotherView.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import SwiftUI
//This page keeps track of all the pages and navigation
struct MotherView: View {
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentPage{
        case .page1:
        //Login Page
            ContentView(viewRouter: viewRouter)
        case .page2:
        //Home Page
            HostingTabBar(viewRouter: viewRouter)
        case .page3:
        //SignUp Page
            SignUpView(viewRouter: viewRouter)
        }

    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
