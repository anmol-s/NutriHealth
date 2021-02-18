//
//  ViewRouter.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import Foundation
import SwiftUI

//This file links objects from all the views to Mother views

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .page1
    
}
