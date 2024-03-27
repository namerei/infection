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
//    var columns: Int { get set }
}

class PopulationManager: PopulationDelegate {
    
    var persons = [Person]()
    weak var delegate: EpidemicCalculatorDelegate?
    
    //MARK: - main parameters
    var groupSize: Int
    var infectionFactor : Int
    var period : Int
    
    //MARK: - engine columns
    var width: CGFloat = 0.0
    

   
    init(groupSize: Int, infectionFactor: Int, period: Int, width: CGFloat) {
        self.groupSize = groupSize
        self.infectionFactor = infectionFactor
        self.period = period
        self.width = width
        print("POP = \(groupSize), width = \(width)")
        
        //MARK: - engine
        let engine = Engine()
        let columns = engine.calculateColumns(width: width, count: groupSize)
        print("COLUMNS = \(columns)")
//        print("POPulation: \(groupSize), \(infectionFactor), \(period)")
        for position in 0..<groupSize {
            self.persons.append(Person(position: position))
            self.persons[position].delegate = self
            self.persons[position].columns = columns
        }
        infectionStart()
    }
    
    private let stepQueue = DispatchQueue(label: "com.step.queue", qos: .background, attributes: .concurrent)
    private let calc = DispatchQueue(label: "com.calc.queue", qos: .utility, attributes: .concurrent)
    private let dispatchGroup = DispatchGroup()
    
    func calculGroup() {
        persons.filter({$0.isInfected}).forEach { item in
            
            guard let countOfNewInfectedPosition = item.newInfectedPositions?.count, countOfNewInfectedPosition > 0 else { return }
            
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
        stepQueue.asyncAfter(deadline: .now() + .seconds(period), execute: { [weak self] in
            guard let self else { return }
            guard self.checkHealtys() else { return }
            calculGroup()
            step()
        })
    }
    
    private func update() {
//        print("CHECK:  \(persons.filter({$0.isInfected}).count), stopped: \(persons.filter({$0.stopped}).count)")
        delegate?.update()
    }

    private func checkHealtys() -> Bool {
        let result = persons.filter({$0.isInfected}).count < groupSize
        if !result {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                delegate?.finish()
            }
        }
        return result
    }
    
    func recalculateColumns() {
//        let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)
        let columnsGroup = DispatchGroup()
        
//        concurrentQueue.async { [weak self] in
        calc.async(group: columnsGroup) { [weak self] in
            guard let self else { return }
            let engine = Engine()
            let columns = engine.calculateColumns(width: width, count: groupSize)
            print("NEW COLUMNS = \(columns)")
            for position in 0..<groupSize {
                persons.append(Person(position: position))
                persons[position].columns = columns
            }
            
            columnsGroup.notify(queue: .main) {[weak self] in
                guard let self else {return}
                update()
            }
        }
    }
    
    //MARK: - spread around
    func infectionStart() {
        step()
    }

}





/*
фикисрованные размеры collection view в ширину
 несколько роазмеров чтобы помещалось от 
 */
