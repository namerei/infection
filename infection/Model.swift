//
//  Model.swift
//  infection
//
//  Created by Nikita Evdokimov on 23.03.24.
//

import Foundation

class Population {
    var count: Int?
    var persons: [Person]?
    
    init(count: Int) {
        self.count = count
        for _ in 0..<count {
            self.persons?.append(Person())
        }
    }
}

class Person {
    var isInfected: Bool = false
    var position = -1
}

class Model {
    var person = Person()
    var delegate: PersonCell? = nil
    
    func infect() {
        print("was infected")
    }
}
