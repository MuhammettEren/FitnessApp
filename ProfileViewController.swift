//
//  ProfileViewController.swift
//  FitnessApp
//
//  Created by Muhammet Eren on 6.07.2023.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let LogOutButton = UIButton(type: .system)
        LogOutButton.setTitle("LOG OUT", for: .normal)
        LogOutButton.frame = CGRect(x: 50, y: 150, width: 300, height: 50)
        LogOutButton.backgroundColor = .red
        LogOutButton.setTitleColor(.white, for: .normal)
        LogOutButton.layer.borderWidth = 3.0
        LogOutButton.layer.borderColor = UIColor.red.cgColor
        LogOutButton.layer.cornerRadius = 12.0
        LogOutButton.clipsToBounds = true
        LogOutButton.addTarget(self, action: #selector(didTapLogOut), for: .touchUpInside)
        view.addSubview(LogOutButton)
        
    }
    @objc func didTapLogOut() {
        let alert = UIAlertController(title: "Çıkış Yap", message: "Çıkmak istediğinize emin misiniz?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        let logoutAction = UIAlertAction(title: "Çıkış Yap", style: .destructive) { _ in
            
            UserDefaults.standard.removeObject(forKey: "userLoggedIn") // Kullanıcı oturumunu sonlandır
            self.navigationController?.popToRootViewController(animated: true) // WelcomeViewController'a geri dön
        }
        
        alert.addAction(cancelAction)
        alert.addAction(logoutAction)
        
        present(alert, animated: true, completion: nil)
    }

    
    
    
    
    
    
  

}
