//
//  ParametersTVC.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

class ParametersTVC: UITableViewController {
    let cellData: [(title: String, placeholder: String)] = [
        ("Group Size", "Enter group size"),
        ("Infection Factor ", "Enter infection factor 1..8"),
        ("Period", "Enter period 1..60")
    ]
    
    let startButton = UIButton()
    
    var groupSize: Int?
    var infectionFactor: Int?
    var period: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarButtons()
        configureStartButton()
        // Register custom UITableViewCell class if needed
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //MARK: - button
    func configureStartButton() {
        // Configure start button
        startButton.setTitle("Start Simulation", for: .normal)
        startButton.backgroundColor = .blue
        startButton.addTarget(self, action: #selector(startSimulationButtonTapped), for: .touchUpInside)
        
        // Add start button to the view hierarchy
        view.addSubview(startButton)
    }
    
    @objc func startSimulationButtonTapped() {
        // Получаем индексы секций с текстовыми полями
        let groupSizeIndexPath = IndexPath(row: 0, section: 0)
        let infectionFactorIndexPath = IndexPath(row: 0, section: 1)
        let periodIndexPath = IndexPath(row: 0, section: 2)
        
        // Получаем текст из текстовых полей
        if let groupSizeCell = tableView.cellForRow(at: groupSizeIndexPath),
           let groupSizeTextField = groupSizeCell.contentView.subviews.first as? UITextField,
           let groupSizeText = groupSizeTextField.text {
            groupSize = Int(groupSizeText)
        }
        
        if let infectionFactorCell = tableView.cellForRow(at: infectionFactorIndexPath),
           let infectionFactorTextField = infectionFactorCell.contentView.subviews.first as? UITextField,
           let infectionFactorText = infectionFactorTextField.text {
            infectionFactor = Int(infectionFactorText)
        }
        
        if let periodCell = tableView.cellForRow(at: periodIndexPath),
           let periodTextField = periodCell.contentView.subviews.first as? UITextField,
           let periodText = periodTextField.text {
            period = Int(periodText)
        }
        
        if correctFieldsChecked() {
            goToInfectionVC()
        }
    }
    
    func goToInfectionVC() {
        // Perform simulation with extracted parameters
        let infectionVC = InfectionViewController()
        let parameters = [groupSize!, infectionFactor!, period!]
        infectionVC.parameters = parameters
        
//        infectionVC.population = PopulationManager(groupSize: groupSize!, infectionFactor: infectionFactor!, period: period!)
        
        navigationController?.pushViewController(infectionVC, animated: true)
    }
    
    func correctFieldsChecked() -> Bool {
        if groupSize == nil || infectionFactor == nil || period == nil || groupSize! < 1 || infectionFactor! < 1 || period! < 1 {
            self.showEmptyFieldsAlert()
            return false
        }
        return true
    }

    func setNavBarButtons() {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(startSimulation))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "info", style: .plain, target: self, action: #selector(showInfo))
    }
    
    //MARK: - acitons
    @objc func showInfo() {
        self.showInstructionAlert()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return 0
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        tableView.separatorStyle = .none
        
        // Create text field
        let textField = UITextField(frame: CGRect(x: 15, y: 0, width: cell.contentView.frame.width - 30, height: cell.contentView.frame.height))
        textField.placeholder = cellData[indexPath.section].placeholder
        textField.tag = indexPath.section // Set tag to identify text field
        textField.delegate = self
        textField.keyboardType = .asciiCapableNumberPad
        
//        textField.textAlignment = .center
        cell.contentView.addSubview(textField)

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 3 {
            return startButton
        }
        
        let headerLabel = UILabel()
        headerLabel.textAlignment = .center
        headerLabel.text = cellData[section].title
        headerLabel.font = .systemFont(ofSize: 18, weight: .bold)
        headerLabel.textColor = UIColor.systemCyan
        
        return headerLabel
    }
}

extension ParametersTVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
