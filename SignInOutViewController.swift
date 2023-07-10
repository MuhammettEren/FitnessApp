//
//  SignInOutViewController.swift
//  FitnessApp
//
//  Created by Muhammet Eren on 5.07.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let backgroundImage = UIImage(named: "inout")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.alpha = 0.1
        view.addSubview(backgroundImageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 50, y: 300, width: 300, height: 80))
        titleLabel.text = "Fitness at your"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 45)
        
        let subTitlelabel = UILabel(frame: CGRect(x: 50, y: 340, width: 300, height: 80))
        subTitlelabel.text = "fingertips"
        subTitlelabel.textColor = .red
        subTitlelabel.textAlignment = .center
        subTitlelabel.font = UIFont.boldSystemFont(ofSize: 45)
        
        let miniTitleLabel = UILabel(frame: CGRect(x: 50, y: 400, width: 300, height: 80))
        miniTitleLabel.text = "Spend some fun time at gym with anytime training anywhere!"
        miniTitleLabel.textColor = .white
        miniTitleLabel.textAlignment = .center
        miniTitleLabel.font = UIFont.systemFont(ofSize: 15)
        miniTitleLabel.numberOfLines = 2
        
        
        view.addSubview(titleLabel)
        view.addSubview(subTitlelabel)
        view.addSubview(miniTitleLabel)
        
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.frame = CGRect(x: 50, y: 500, width: 300, height: 50)
        signInButton.backgroundColor = .red
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.borderWidth = 3.0
        signInButton.layer.borderColor = UIColor.red.cgColor
        signInButton.layer.cornerRadius = 12.0
        signInButton.clipsToBounds = true
        
        
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.frame = CGRect(x: 50, y: 580, width: 300, height: 50)
        signUpButton.backgroundColor = .red
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.borderWidth = 3.0
        signUpButton.layer.borderColor = UIColor.red.cgColor
        signUpButton.layer.cornerRadius = 12.0
        signUpButton.clipsToBounds = true
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        
        
        
        
        
    }
    
    @objc private func didTapSignInButton(){
        let vc = SignInViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc private func didTapSignUpButton(){
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
  

}


