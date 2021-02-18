//
//  NutriHealthApp.swift
//  NutriHealth
//
//  Created by Owner on 2/6/21.
//

import SwiftUI

@main
struct NutriHealthApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter) //the page that handles all Navigation
        }
    }
}
