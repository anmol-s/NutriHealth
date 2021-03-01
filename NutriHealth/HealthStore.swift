//
//  HealthStore.swift
//  NutriHealth
//
//  Created by Victoria  on 3/1/21.
//

import Foundation
import HealthKit

extension Date {
    static func mondayAt12AM() -> Date {
        //return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        return NSCalendar(calendarIdentifier: .ISO8601)!.date(from: NSCalendar(calendarIdentifier: .ISO8601)!.components([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}

class HealthStore {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func calculateCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        
        let calorieType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        let startDate = NSCalendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: calorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        query!.initialResultsHandler = { query, statisticsCollection, error in
            completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let query = self.query {
            healthStore.execute(query)
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        
        let calorieType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        let bmiType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!
        
        // unwrap healthStore
        guard let healthStore = self.healthStore else { return completion(false)}
        healthStore.requestAuthorization(toShare: [], read: [calorieType, bmiType]) { (success, error) in
            completion(success)
        }
        
    }
}
