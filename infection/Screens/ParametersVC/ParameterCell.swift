//
//  ParameterCell.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

//class ParameterCell: UITableViewCell {
//    static var id = "ParameterCell"
//    var parameterTitleLabel: UILabel!
//    var parameterTextField: UITextField!
////    var parametr: Parameter?
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        // Initialize and configure UI elements
//        parameterTitleLabel = UILabel()
//        parameterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(parameterTitleLabel)
//        
//        parameterTextField = UITextField()
//        parameterTextField.translatesAutoresizingMaskIntoConstraints = false
//        parameterTextField.textAlignment = .right
//        parameterTextField.keyboardType = .asciiCapableNumberPad
//        contentView.addSubview(parameterTextField)
//        
//        // Set up constraints
//        NSLayoutConstraint.activate([
//            parameterTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            parameterTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            parameterTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            parameterTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//        ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
