//
//  CustomTextField.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//


import UIKit

final class CustomTextField: UITextField {
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds: CGRect) -> CGRect {
        return forBounds.insetBy(dx: Styles.padding , dy: Styles.padding)
     }

     override func editingRect(forBounds: CGRect) -> CGRect {
         return forBounds.insetBy(dx: Styles.padding , dy: Styles.padding)
     }

     override func placeholderRect(forBounds: CGRect) -> CGRect {
         return forBounds.insetBy(dx: Styles.padding, dy: Styles.padding)
     }
    
    func setPlaceholder(_ placeholderString: String) {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderString,
            attributes: [
                .foregroundColor: Styles.Color.mustard ?? .yellow,
                .font: Styles.inputFont
            ]
        )
    }
    
    private func setup() {
        self.backgroundColor = Styles.Color.mustardWithAlpha
        self.layer.cornerRadius = Styles.cornerRadius
        self.layer.masksToBounds = true
        self.tintColor = Styles.Color.yellow
        self.font = Styles.inputFont
        self.textColor = Styles.Color.yellow
        
        self.keyboardType = .phonePad
        self.keyboardAppearance = .dark
    }
}


struct Styles {
    struct Color {
        static let black = UIColor(named: "BlackColor")
        static let mustard = UIColor(named: "MustardColor")
        static let mustardWithAlpha = mustard?.withAlphaComponent(0.5)
        static let yellow = UIColor(named: "YellowColor")
    }
    
    static let titleFont = UIFont.systemFont(ofSize: 40, weight: .bold)
    static let inputFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let padding: CGFloat = 16.0
    static let cornerRadius: CGFloat = 10.0
}
