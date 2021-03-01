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
            Text("Home").font(.title)
            CalendarView()
            RecoRow(items: ["Reco1","Reco2"]).offset(y:-150)
            DailyIntakeColumn(items: ["1","2"]).offset(y:-150)
            Spacer()
            
            // display calories expended from Apple Health data
            List(calories, id: \.id) { calorie in
                VStack {
                    Text("\(calorie.count)")
                    Text(calorie.date, style: .date).opacity(0.5)
                }
            }
        }
        
        .onAppear {
            if let healthStore = healthStore {
                healthStore.requestAuthorization { success in
                    if success {
                        healthStore.calculateCalories { statisticsCollection in
                            if let statisticsCollection = statisticsCollection {
                                updateUIFromStatistics(statisticsCollection)
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
