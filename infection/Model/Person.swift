//
//  Person.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import Foundation

class Person {
    var isInfected: Bool = false
    var position: Int = -1
    var columns: Int = 0
    
    weak var delegate: PopulationDelegate?
    var newInfectedPositions : [Int]?
    var stopped: Bool = false
    
    func infect() {
        isInfected = true
    }
    
    init(position: Int) {
        self.position = position
    }
    
    func stopSpread() {
        stopped = true
}
    
    func shufflePosition() {
        if stopped {
            return
        }
        let healthyNearbyPositions = checkNearbyPositions(around: position)
        
        if healthyNearbyPositions.isEmpty {
            stopSpread()
            return()
        }
        
        newInfectedPositions = Array<Int>(healthyNearbyPositions.filter({$0>=0 && $0 != position && !delegate!.persons[$0].isInfected}).shuffled().prefix(delegate!.infectionFactor))
    }
    
    func spread() {
        if isInfected || stopped {
            return
        }
        self.infect()
        
        let healthyNearbyPositions = checkNearbyPositions(around: position)
        
        if healthyNearbyPositions.isEmpty {
            stopSpread()
            return()
        }
        
        newInfectedPositions = Array<Int>(healthyNearbyPositions.filter({$0>=0 && $0 != position && !delegate!.persons[$0].isInfected}).shuffled().prefix(delegate!.infectionFactor))
    }
    
    func checkNearbyPositions(around index: Int) -> [Int] {
        var healthyNearbyPositions: [Int] = Array(repeating: -1, count: 9)
        healthyNearbyPositions[0] = index - columns - 1
        healthyNearbyPositions[1] = index - columns
        healthyNearbyPositions[2] = index - columns + 1
        
        healthyNearbyPositions[3] = index - 1
        healthyNearbyPositions[4] = index
        healthyNearbyPositions[5] = index + 1
        
        healthyNearbyPositions[6] = index + columns - 1
        healthyNearbyPositions[7] = index + columns
        healthyNearbyPositions[8] = index + columns + 1
        
        for pos in 0..<9 {
            if healthyNearbyPositions[pos] >= delegate!.groupSize {
                healthyNearbyPositions[pos] = -1
            }
        }

        if index % columns == 0 {
            healthyNearbyPositions[0] = -1
            healthyNearbyPositions[3] = -1
            healthyNearbyPositions[6] = -1
        }
        
        if (index + 1) % columns == 0 {
            healthyNearbyPositions[2] = -1
            healthyNearbyPositions[5] = -1
            healthyNearbyPositions[8] = -1
        }
        
        if index - columns < 0 {
            healthyNearbyPositions[0] = -1
            healthyNearbyPositions[1] = -1
            healthyNearbyPositions[2] = -1
        }
        
        if index - columns >= delegate!.groupSize {
            healthyNearbyPositions[6] = -1
            healthyNearbyPositions[7] = -1
            healthyNearbyPositions[8] = -1
        }
        
        if index + columns >= delegate!.groupSize {
            healthyNearbyPositions[6] = -1
            healthyNearbyPositions[7] = -1
            healthyNearbyPositions[8] = -1
        }
        
        let result = healthyNearbyPositions.filter({$0 >= 0 && !delegate!.persons[$0].isInfected})
        
        return result
    }
}
