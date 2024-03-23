//
//  ViewController.swift
//  infection
//
//  Created by Nikita Evdokimov on 21.03.24.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var collectionView: UICollectionView!
    let numberOfItems = 1000
//    var cellColors = [Int: UIColor]() // Dictionary to store cell colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.id, for: indexPath) as! PersonCell
        
        // Retrieve color from dictionary, or set default color
//        cell.normalColor = cellColors[indexPath.item] ?? .green
//        cell.color = .blue
//        cell.selectedColor = .blue
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? PersonCell {
            cell.isSelected = !cell.isSelected
            
            // Store color in dictionary
            print("\(indexPath.item) was selected")
//            cellColors[indexPath.item] = cell.isSelected ? cell.selectedColor : cell.normalColor
//            cell.color = .blue
        }
    }
}

