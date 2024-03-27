//
//  MinusScaleButton.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

class MinusScaleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        self.setTitle("-", for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 70, weight: .bold)
        self.setTitleColor(.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
