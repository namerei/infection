//
//  ResultLabel.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

class ResultLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLabel()
    }

    private func setupLabel() {
        self.textAlignment = .center
        self.textColor = .black
//        self.backgroundColor = .yellow
        self.font = UIFont.systemFont(ofSize: 18)
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func update() {
        
    }
}

