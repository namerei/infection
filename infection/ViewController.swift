//
//  ViewController.swift
//  infection
//
//  Created by Nikita Evdokimov on 21.03.24.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView!
    //    let numberOfItems = 1000
    var population = Population(count: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()

        layout.itemSize = CGSize(width: 20, height: 20)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
    }
    
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return population.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.id, for: indexPath) as! PersonCell
        
        //MARK: - logic
        //        print("her")
        let positionInfected = indexPath.row
        cell.backgroundColor = (population.persons[positionInfected].isInfected ? .blue : UIColor(.green))
        //            cell.backgroundColor = UIColor(.green)
        //
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PersonCell {
            //            cell.isSelected = !cell.isSelected
            
            //MARK: logic
            let positionInfected = indexPath.row
            population.infectPerson(positionInfected)
            cell.backgroundColor = (population.persons[positionInfected].isInfected ? .blue : .green)
            
            //MARK: - async
            population.spreadInfectionRandom {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            //MARK: - async after
            //            population.spreadInfection()
        }
    }
    
}
