//
//  PersonCell.swift
//  infection
//
//  Created by Nikita Evdokimov on 23.03.24.
//

import UIKit

class PersonCell: UICollectionViewCell {
    static var id = "PersonCell"
    static var width: CGFloat = 30
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
