//
//  ParametersTableViewController.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

//class ParametersTableViewController: UITableViewController {
//
//    // Data source for table view cells
//    let cellData: [(title: String, placeholder: String)] = [
//        ("Group Size", "Enter group size"),
//        ("Infection Factor", "Enter infection factor"),
//        ("Period", "Enter period")
//    ]
////    private var parameters = Parameters()
//    
//    var groupSize: Int?
//    var infectionFactor: Int?
//    var period: Int?
//
////    private var myTF: UITextField?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setTableView()
//        setNavBarButtons()
//    }
//    
//    //MARK: - Set UI
//    func setTableView() {
//        // Register custom UITableViewCell class
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ParameterCell")
//
//        // Configure table view
////        tableView.tableFooterView = UIView() // Hide empty cells
//        tableView.separatorInset = UIEdgeInsets.zero
//        tableView.allowsSelection = false
//    }
//    
//    func setNavBarButtons() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(startSimulation))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "info", style: .plain, target: self, action: #selector(showInfo))
//    }
//    
//    
//    // MARK: - Table view data source
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellData.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ParameterCell", for: indexPath)
//        let data = cellData[indexPath.row]
//        
//        cell.textLabel?.text = data.title
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
//        
//        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
//        textField.placeholder = data.placeholder
//        textField.font = UIFont.systemFont(ofSize: 14)
//        textField.textAlignment = .right
//        textField.keyboardType = .asciiCapableNumberPad
//        
//        //MARK: - add done button
//        textField.inputAccessoryView = setToolbarWithDoneButton()
//        
////        textField.returnKeyType = .done
//        textField.tag = indexPath.row // Set tag to identify text field
//        cell.accessoryView = textField // Set text field as accessory view
//        
//        return cell
//    }
//    
//    func setToolbarWithDoneButton() -> UIToolbar {
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
//        
//        let toolbar = UIToolbar()
//        toolbar.barStyle = .default
//        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton]
//        toolbar.sizeToFit()
//        return toolbar
//        
//        // Устанавливаем созданный ToolBar в качестве inputAccessoryView для текстового поля
//    }
//    
//    @objc func doneButtonTapped() {
//        view.endEditing(true)
//        print("tapper")
//        
//    }
//
//    // MARK: - Actions
//
//    @objc func showInfo() {
//        self.showInstructionAlert()
//    }
//    
//    @objc func startSimulation() {
////        var groupSize = 0
////        var infectionFactor = 0
////        var period = 0
//
//        // Iterate over table view cells to extract values from text fields
//        for cellDataIndex in 0..<cellData.count {
//            let indexPath = IndexPath(row: cellDataIndex, section: 0)
//            if let cell = tableView.cellForRow(at: indexPath),
//               let textField = cell.accessoryView as? UITextField,
//               let text = textField.text,
//               let value = Int(text) {
//                switch cellDataIndex {
//                case 0:
//                    groupSize = value
//                case 1:
//                    infectionFactor = value
//                case 2:
//                    period = value
//                default:
//                    break
//                }
//            }
//           
//            
//            print(groupSize, infectionFactor, period)
//            
//            //MARK: - check filled
////            if !parameters.filled() {
////                print("NOT FILLED")
////                self.showEmptyFieldsAlert()
//////                self.showInstructionAlert()
////            }
//            
////            print(parameters.groupSize, parameters.infectionFactor, parameters.period)
//        }
//
//        // Perform simulation with extracted parameters
////        let viewController = MyViewController(parameters: parameters)
////        navigationController?.pushViewController(viewController, animated: true)
//        
////        parameters.erase()
//        //MARK: reset all TF
//    }
//}
