//
//  Engine.swift
//  infection
//
//  Created by Nikita Evdokimov on 25.03.24.
//

import Foundation

protocol EpidemicCalculatorDelegate: AnyObject {
//    func update(with items: [Bool], progress: CGFloat)
    //MARK: - width
//    var width: CGFloat { get set }
    func update()
    func finish()
}

protocol PopulationDelegate: AnyObject {
    var persons: [Person] { get set }
    var groupSize: Int { get set }
    var infectionFactor : Int { get set }
    var period : Int { get set }
    var columns: Int { get set }
}

class PopulationManager: PopulationDelegate {
    
    var persons = [Person]()
    weak var delegate: EpidemicCalculatorDelegate?
    
    //MARK: - main parameters
    var groupSize: Int
    var infectionFactor : Int
    var period : Int
    
    //MARK: - engine columns
    var columns: Int = 9
//    var columns: Int = 0
//    var engine = Engine()
//    var row = 36
//    var columns = 9
   
//    var newInfectedPositions = [Int]()
    
    init(groupSize: Int, infectionFactor: Int, period: Int) {
        self.groupSize = groupSize
        self.infectionFactor = infectionFactor
        self.period = period
//        self.columns = engine.calculateRowAndColumns(width: width, count: groupSize)
//        print("COLUMNS = \(self.columns)")
//        print("POPulation: \(groupSize), \(infectionFactor), \(period)")
        for position in 0..<groupSize {
            self.persons.append(Person(position: position))
            self.persons[position].delegate = self
//            self.persons[position].columns = columns
        }
        infectionStart()
    }
    
    private let stepQueue = DispatchQueue(label: "com.step.queue", qos: .background, attributes: .concurrent)
    private let calc = DispatchQueue(label: "com.calc.queue", qos: .utility, attributes: .concurrent)
    
    let dispatchGroup = DispatchGroup()
    
    func calculGroup() {
        persons.filter({$0.isInfected}).forEach { item in
            
            guard let countOfNewInfectedPosition = item.newInfectedPositions?.count, countOfNewInfectedPosition > 0 else { return }
            //            print("countOfNewInfectedPosition = \(countOfNewInfectedPosition)")
            
            let semaphore = DispatchSemaphore(value: countOfNewInfectedPosition)
            
            calc.async(group: dispatchGroup) { [weak self] in
                guard let self else {return}
                semaphore.wait()
                
                item.newInfectedPositions?.forEach({self.persons[$0].spread()})
                item.shufflePosition()
                
                semaphore.signal()
            }
        }
        dispatchGroup.notify(queue: .main) {[weak self] in
            guard let self else {return}
            update()
        }
    }
    
    
    func step() {
//        print("-----------step-----------")
        stepQueue.asyncAfter(deadline: .now() + .seconds(period), execute: { [weak self] in
            guard let self else { return }
            guard self.checkForHealthy() else { return }
            calculGroup()
            step()
        })
    }
    
    private func update() {
        print("CHECK:  \(persons.filter({$0.isInfected}).count), stopped: \(persons.filter({$0.stopped}).count)")
        delegate?.update()
    }

    private func checkForHealthy() -> Bool {
//        print("checkforhealty!")
//        let result = infectedPositions.count < count
        let result = persons.filter({$0.isInfected}).count < groupSize
        if !result {
            DispatchQueue.main.async {
                //self?.delegate?.finish()
                print("FinisHH!!!")
                //FIXME: showAlert
//                print("CHECK: \(result), \(persons.filter({$0.isInfected}).count), stopped: \(persons.filter({$0.stopped}).count)")
            }
        }
//        print("CHECK: \(result), \(persons.filter({$0.isInfected}).count), stopped: \(persons.filter({$0.stopped}).count)")
        return result
    }
    
    //MARK: - spread around
    
    func infectionStart() {
//        self.columns = Engine().calculateRowAndColumns(width: delegate!.width, count: groupSize)
        step()
    }

}





/*
фикисрованные размеры collection view в ширину
 несколько роазмеров чтобы помещалось от 
 */
