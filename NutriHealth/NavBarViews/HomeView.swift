//
//  HomeView.swift
//  NutriHealth
//
//  Created by apple on 2/17/21.
//

import SwiftUI
import HealthKit
//This is the home page
struct HomeView: View {
    
    private var healthStore: HealthStore?
    @State private var calories: [Calorie] = [Calorie]()
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        UISegmentedControl.appearance().backgroundColor = UIColor.white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        let startDate = NSCalendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for:  .count())

            let calorie = Calorie(count: Int(count ?? 0), date: statistics.startDate)
            calories.append(calorie)
        }
    }
    
    
    var body: some View {
        
        VStack
        {
            Rectangle()
                .frame(height: 80)
                .foregroundColor(.blue)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            Text("Dashboard").font(.system(size: 18)).fontWeight(.semibold).offset(y:-41)
            CalendarView().offset(y:-48) // This calendar always has a full-size calendar frame. Doesn't matter if you change it to week, month, etc. People complained but nothing we can do.
            RecoRow().offset(y:-180)
            DailyIntakeColumn().offset(y:-180)
            Spacer()
            
            // display calories expended from Apple Health data
            
            
// ----- I THINK THIS JUST PUT HERE AS A TEST. NOT SURE WE NEED THIS FOR DISPLAY -----
//            List(calories, id: \.id) { calorie in
//                VStack {
//                    Text("\(calorie.count)")
//                    Text(calorie.date, style: .date).opacity(0.5)
//                }
//            }
// ----- I THINK THIS JUST PUT HERE AS A TEST. NOT SURE WE NEED THIS FOR DISPLAY -----
            
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            if let healthStore = healthStore {
                healthStore.requestAuthorization { success in
                    if success {
                        healthStore.calculateActiveCalories { statisticsCollectionActive in
                            if let statisticsCollectionActive = statisticsCollectionActive {
                                updateUIFromStatistics(statisticsCollectionActive)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
