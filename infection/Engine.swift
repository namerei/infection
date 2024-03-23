//
//  Model.swift
//  infection
//
//  Created by Nikita Evdokimov on 23.03.24.
//

import Foundation

class Population {
    var count: Int = 0
    var persons = [Person]()
    
    init(count: Int) {
        self.count = count
        for position in 0..<count {
            self.persons.append(Person(position: position))
        }
    }
    
    func infectPerson(_ position: Int) {
        persons[position].infect()
        print("\(persons.filter({$0.isInfected}).count) persons infected")
    }
    
        func spreadInfectionRandom(completion: @escaping () -> Void) {
            DispatchQueue.global().async { [self] in
                for _ in 0..<count {
                    
                    let nonInfectedPositions = persons
                        .filter { !$0.isInfected }
                        .map { $0.position }
                    
                    let randomNumber = nonInfectedPositions.randomElement()
                    self.persons[randomNumber ?? 0].infect()
                   
                    print("\(persons.filter({$0.isInfected}).count) persons infected")
                    usleep(300_000)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                }
                DispatchQueue.main.async {
                    completion()
                    print("GAME OVER")
                }
            }
        }
    
    }
    

class Person {
    var isInfected: Bool = false
    var position: Int = -1
    
    func infect() {
        isInfected = true
        print("was infected on position = \(position)")
    }
    
    init(position: Int) {
        self.position = position
    }

}


class Engine {
    var row:Double = 0.0
    var columns = 0
    var width: CGFloat = 0
//    var height = 0
    
    func calculateRowAndColumns(width: CGFloat) {
        print(width)
        row = (width) / (PersonCell.width + 2.0)
        var rowInt = Int(round(row))
        print("\(row)'s rows")
        print("\(rowInt)'s rows")
        print("\((PersonCell.width + 2.0) * row)")
    }
    
//    init(width: CGFloat) {
//        self.width = width
//    }
}
