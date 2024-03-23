//
//  CusomView.swift
//  infection
//
//  Created by Nikita Evdokimov on 23.03.24.
//

import UIKit

class PersonCell: UICollectionViewCell {
    var color = UIColor(.green)
    var model: Model?
    static var id = "PersonCell"
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = color
            model!.infect()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = color
        model = Model()
        model!.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
