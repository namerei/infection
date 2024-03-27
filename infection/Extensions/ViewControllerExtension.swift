//
//  ViewControllerExtension.swift
//  infection
//
//  Created by Nikita Evdokimov on 27.03.24.
//

import UIKit

let message = """

- количество людей в моделируемой группе - GroupSize (например, 100, максимум 100000);

- количество людей, которое может быть заражено одним человеком при контакте - InfectionFactor (например, 3);

- период пересчёта количества заражённых людей - Period (например 1 секунда).

"""

extension UIViewController {
    
    func showEmptyFieldsAlert() {
        let alertController = UIAlertController(title: nil, message: "Чтобы начать игру поля должны быть заполнены корректно.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            //MARK: - exit AC
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showInstructionAlert() {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func showGameOverAlert() {
        let alertController = UIAlertController(title: nil, message: "Игра завершена", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
