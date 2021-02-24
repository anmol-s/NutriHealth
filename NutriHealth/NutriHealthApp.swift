//
//  NutriHealthApp.swift
//  NutriHealth
//
//  Created by Owner on 2/6/21.
//

import SwiftUI
import Parse

@main
struct NutriHealthApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    init(){
        let configuration = ParseClientConfiguration {
          $0.applicationId = "WVB0xXwXsUCNioboS0Te6Im1MLqf6RrVdvYnLrDl"
          $0.clientKey = "Q3zPVtYKCvNndDOEGdpjPzfuJhBpyus09NaLIzBq"
          $0.server = "https://parseapi.back4app.com/"
        }
        Parse.initialize(with: configuration)
    }
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter) //the page that handles all Navigation
        }
    }
}
