//
//  Calendar.swift
//  NutriHealth
//
//  Created by Owner on 2/28/21.
//

import SwiftUI
import FSCalendar
//Refer for backend and frontend: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces

struct Calendar: View
{
    var body: some View
    {
        CalendarView()
            .frame(height: 200.0)
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View
    {
        Calendar()
    }
}

struct CalendarView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView
    {
        let calendar = FSCalendar()
        calendar.scope = .week
        return calendar
    }

    func updateUIView(_ uiView: UIView, context: Context)
    {
        
    }
}
