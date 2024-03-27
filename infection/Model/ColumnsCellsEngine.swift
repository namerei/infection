//
//  ColumnsCellsEngine.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import Foundation


class Engine {
    var row = 0
    //    var columns = 0
    var width: CGFloat = 0
    var count = 0
    
    
    func calculateColumns(width: CGFloat, count: Int) -> Int {
        self.count = Int(count)
        print(width)
        let columnsDouble = (width) / (PersonCell.width + 2.0)
        let columns = Int(round(columnsDouble))
        print("\(columns)'s columns")
        
        //        row = Int(round(Double(count) / Double(columns)))
        //        print("\(row)'s rows")
        //        print("\(rowInt)'s rows")
        //        print("\((PersonCell.width + 2.0) * row)")
        return columns
    }
}
 
