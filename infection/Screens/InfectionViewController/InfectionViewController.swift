//
//  InfectionViewController.swift
//  infection
//
//  Created by Nikita Evdokimov on 21.03.24.
//

import UIKit

class InfectionViewController: UIViewController  {
    
    var infectionCollectionView: InfectionCollectionView!
    let resultLabel = ResultLabel()
    let plusScaleButton = PlusScaleButton()
    let minusScaleButton = MinusScaleButton()
    
//    var infectedPerson = 0
    
    var population : PopulationManager?
//    var engine = Engine()
    var screenWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        population?.delegate = self
//        infectionCollectionView.population = population
//        let width = view.bounds.width
//        print("WIDTH: \(width)")
        
//        population?.width = view.bounds.width
        
        view.backgroundColor = .white
        infectionCollectionView = InfectionCollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        infectionCollectionView.population = population
        
        arrangeResultLabel()
        arrangePlusScaleButton()
        arrangeMinusScaleButton()
        arrangeInfectionCollectionView()
        
//        engine.calculateRowAndColumns(width: view.bounds.width, count: population!.groupSize)
    }
    
    //MARK: - set UI
    func arrangeResultLabel() {
        resultLabel.text = "Заражено 0 из \(population!.groupSize) "
        view.addSubview(resultLabel)

        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func arrangeInfectionCollectionView() {
        
        
        view.addSubview(infectionCollectionView)
        infectionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infectionCollectionView.topAnchor.constraint(equalTo: plusScaleButton.bottomAnchor, constant: 2),
            infectionCollectionView.widthAnchor.constraint(equalToConstant: view.bounds.width),
//            infectionCollectionView.heightAnchor.constraint(equalToConstant: view.bounds.height / 1.5)
            infectionCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5)
        ])
    }
    
    func arrangePlusScaleButton() {
        plusScaleButton.addTarget(self, action: #selector(plusScaleButtonTapped), for: .touchUpInside)
        view.addSubview(plusScaleButton)
        
        NSLayoutConstraint.activate([
            plusScaleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            plusScaleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            plusScaleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func arrangeMinusScaleButton() {
        minusScaleButton.addTarget(self, action: #selector(minusScaleButtonTapped), for: .touchUpInside)
        view.addSubview(minusScaleButton)
        
        NSLayoutConstraint.activate([
            minusScaleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            minusScaleButton.trailingAnchor.constraint(equalTo: plusScaleButton.leadingAnchor, constant: -10),
            minusScaleButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    //MARK: Actions
    @objc private func plusScaleButtonTapped() {
        print("+")
    }
    
    @objc private func minusScaleButtonTapped() {
        print("-")
    }
    
}

extension InfectionViewController: EpidemicCalculatorDelegate {
    func update() {
        let infectedPersons = population?.persons.filter({$0.isInfected}).count ?? 0
        resultLabel.text = "Заражено \(infectedPersons) из \(population!.groupSize) "
        self.infectionCollectionView.reloadData()
    }
    
    func finish() {
        //MARK: - show alert
        print("finish")
    }
}
