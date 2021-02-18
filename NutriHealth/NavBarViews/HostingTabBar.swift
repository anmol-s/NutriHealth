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
            ReportView()
                .tag(1)
                .tabItem {
                    Text("Report")
                    Image(systemName: "folder.fill")
                }
            ProfileView()
                .tag(2)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar(viewRouter: ViewRouter())
    }
}
