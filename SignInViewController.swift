//
//  SignUpViewController.swift
//  FitnessApp
//
//  Created by Muhammet Eren on 6.07.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Your email..."
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        emailTextField.textColor = .white
        emailTextField.layer.cornerRadius = 12.0
        emailTextField.clipsToBounds = true
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.frame = CGRect(x: 50, y: 410, width: 300, height: 50)
        return emailTextField
        
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Your password..."
        passwordTextField.textAlignment = .left
        passwordTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        passwordTextField.textColor = .white
        passwordTextField.layer.cornerRadius = 12.0
        passwordTextField.clipsToBounds = true
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 50, y: 510, width: 300, height: 50)
        return passwordTextField
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImage(named: "signup")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.alpha = 0.1
        view.addSubview(backgroundImageView)
        
        let signInlabel = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 80))
        signInlabel.text = "SIGN IN"
        signInlabel.textColor = .red
        signInlabel.textAlignment = .center
        signInlabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        
        let welcomeLabel = UILabel(frame: CGRect(x: 50, y: 260, width: 300, height: 80))
        welcomeLabel.text = "Welcome back! Please enter your details to sign in."
        welcomeLabel.textColor = .white
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 20)
        welcomeLabel.numberOfLines = 3
        
        
        let emailLabel = UILabel(frame: CGRect(x: 170, y: 350, width: 50, height: 80))
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let passwordLabel = UILabel(frame: CGRect(x: 150, y: 450, width: 100, height: 80))
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.textAlignment = .center
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        view.addSubview(signInlabel)
        view.addSubview(welcomeLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        
       
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.frame = CGRect(x: 50, y: 590, width: 300, height: 50)
        signInButton.backgroundColor = .red
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.layer.borderWidth = 3.0
        signInButton.layer.borderColor = UIColor.red.cgColor
        signInButton.layer.cornerRadius = 12.0
        signInButton.clipsToBounds = true
        view.addSubview(signInButton)
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        
        
        
      
        
        
    }
    
    @objc private func didTapSignInButton() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
             if let error = error {
                 print("Giriş hatası: \(error.localizedDescription)")
                 
                 // E-posta veya şifre yanlışsa kullanıcıya hata mesajı gösterme
                 if error._code == AuthErrorCode.wrongPassword.rawValue || error._code == AuthErrorCode.invalidEmail.rawValue {
                     let errorMessage = "E-posta veya şifre yanlış"
                     
                     let alert = UIAlertController(title: "Hata", message: errorMessage, preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                     alert.addAction(okAction)
                     self?.present(alert, animated: true, completion: nil)
                     
                     return
                 }
                 
                 // Diğer hatalar için genel bir hata mesajı gösterme
                 let generalErrorMessage = "Giriş hatası"
                 let alert = UIAlertController(title: "Hata", message: generalErrorMessage, preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                 alert.addAction(okAction)
                 self?.present(alert, animated: true, completion: nil)
             } else {
                 // Giriş başarılı
                 let generalWorkoutVC = GeneralWorkoutViewController()
                 self?.navigationController?.pushViewController(generalWorkoutVC, animated: true)
                
             }
         }
        
       
        
        
        
        
        
        
      
        }
    
   
}
