//
//  PersonCell.swift
//  infection
//
//  Created by Nikita Evdokimov on 23.03.24.
//

import UIKit

class PersonCell: UICollectionViewCell {
    static var id = "PersonCell"
    
    var color = UIColor(.green)
    var position: Int?
    
    override var isSelected: Bool {
        didSet {
//            contentView.backgroundColor = .blue
//            model!.infect()
        }
    }
    
    init(position: Int) {
        super.init(frame: .zero)
        self.position = position
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = color
//        model = Model()
//        model!.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
