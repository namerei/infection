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
    
    func infectPerson(position: Int) {
        persons[position].infect()
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
//        self.isInfected = isInfected
        self.position = position
    }
//    func infect() {
//        print("was infected")
//        isInfected = true
//    }
}

//class Engine {
//    var population: Population?
//    var person = Person()
//    var delegate: PersonCell? = nil
//    
//    func infect(personPosition: Int) {
//
//    }
//}
