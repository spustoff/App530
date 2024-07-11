//
//  ResultViewModel.swift
//  App530
//
//  Created by IGOR on 04/05/2024.
//

import SwiftUI
import CoreData

final class ResultViewModel: ObservableObject {
    
    @Published var combinations: [String] = ["High card", "Pair", "Two pair", "Three of a kind", "Straight", "Flush", "Full house", "Four of a kind", "Straight flush", "Royal flush"]
    @Published var currentCombination = ""
    
    @Published var random = String(format: "%.f", Double(.random(in: 1...3)))
    @Published var random1 = String(format: "%.f", Double(.random(in: 1...4)))
    @Published var random2 = String(format: "%.f", Double(.random(in: 1...4)))
    @Published var random3 = String(format: "%.f", Double(.random(in: 1...4)))
    @Published var random4 = String(format: "%.f", Double(.random(in: 1...4)))
    @Published var random5 = String(format: "%.f", Double(.random(in: 1...4)))
    
    @Published var random6 = String(format: "%.f", Double(.random(in: 6...10)))
    @Published var random7 = String(format: "%.f", Double(.random(in: 6...10)))
    @Published var random8 = String(format: "%.f", Double(.random(in: 6...10)))
    @Published var random9 = String(format: "%.f", Double(.random(in: 6...10)))
    @Published var random10 = String(format: "%.f", Double(.random(in: 6...10)))


    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false

    @Published var resSum = ""
    @Published var resCombination = ""
    @Published var resResult = ""

    @Published var results: [ResultModel] = []
    @Published var selectedResult: ResultModel?

    func addResult() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ResultModel", into: context) as! ResultModel

        loan.resSum = resSum
        loan.resCombination = resCombination
        loan.resResult = resResult

        CoreDataStack.shared.saveContext()
    }
    
    func fetchResults() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ResultModel>(entityName: "ResultModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.results = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.results = []
        }
    }
    
}

