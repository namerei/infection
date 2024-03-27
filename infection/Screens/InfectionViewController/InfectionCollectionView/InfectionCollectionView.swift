//
//  InfectionCollectionView.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

class InfectionCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var population: PopulationManager?
    

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
//        let fixedFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 500, height: 500)
//        let layout = UICollectionViewFlowLayout()
//        super.init(frame: fixedFrame, collectionViewLayout: layout)
        
        let layout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 1// Горизонтальный интервал
        layout.minimumLineSpacing =  layout.minimumInteritemSpacing + 1
        
        self.collectionViewLayout = layout
        self.dataSource = self
        self.delegate = self
        
        register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.id)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return population?.groupSize ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: PersonCell.id, for: indexPath) as! PersonCell
        
        if let population = population {
            let isInfected = population.persons[indexPath.row].isInfected
            cell.backgroundColor = isInfected ? .blue : UIColor(.green)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = cellForItem(at: indexPath) as? PersonCell {
            cell.backgroundColor = .blue
            population?.persons[indexPath.row].spread()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: PersonCell.width, height: PersonCell.width)
    }
}
