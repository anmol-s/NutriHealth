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
    var activeQuery: HKStatisticsCollectionQuery?
    var restingQuery: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func calculateActiveCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        print("in HealthStore calculateActiveCalories")
        let activeCalorieType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        
        let startDate = NSCalendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        activeQuery = HKStatisticsCollectionQuery(quantityType: activeCalorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        activeQuery!.initialResultsHandler = { activeQuery, statisticsCollection, error in
            completion(statisticsCollection)
            
        }
        
        if let healthStore = healthStore, let activeQuery = self.activeQuery {
            healthStore.execute(activeQuery)
        }
    }
    
    func calculateRestingCalories(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let restingCalorieType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.basalEnergyBurned)!
        
        let startDate = NSCalendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        restingQuery = HKStatisticsCollectionQuery(quantityType: restingCalorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        restingQuery!.initialResultsHandler = { restingQuery, statisticsCollection, error in
                completion(statisticsCollection)
        }
        
        if let healthStore = healthStore, let restingQuery = self.restingQuery {
            healthStore.execute(restingQuery)
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
