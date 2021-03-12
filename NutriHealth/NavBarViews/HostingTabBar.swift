//
//  HostingTabBar.swift
//  NutriHealth
//
//  Created by apple on 2/18/21.
//

import SwiftUI
//Tab Bar view that will be the landing page

struct HostingTabBar: View {
    @StateObject var viewRouter = ViewRouter()
    private enum Tab: Hashable {
        case home
        case report
        case profile
        case log
    }
    init(viewRouter: ViewRouter){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    @State private var selectedTab: Tab = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            FoodView()
                .tag(1)
                .tabItem {
                    Text("Food")
                    Image(systemName: "leaf.fill")
                }
            ProfileView()
                .tag(2)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.fill")
                }
            InputView()
                .tag(3)
                .tabItem{
                    Text("Input")
                    Image(systemName:"plus")
                }
        }
    }
}

struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar(viewRouter: ViewRouter())
    }
}
