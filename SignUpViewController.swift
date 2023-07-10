//
//  SignUpViewController.swift
//  FitnessApp
//
//  Created by Muhammet Eren on 6.07.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Your name..."
        nameTextField.textAlignment = .left
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        nameTextField.textColor = .white
        nameTextField.layer.cornerRadius = 12.0
        nameTextField.clipsToBounds = true
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.frame = CGRect(x: 50, y: 330, width: 300, height: 50)
        
        return nameTextField
        
    }()
    private let mobileNoTextField: UITextField = {
        let mobileNoTextField = UITextField()
        mobileNoTextField.placeholder = "Your mobile no..."
        mobileNoTextField.textAlignment = .left
        mobileNoTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        mobileNoTextField.textColor = .white
        mobileNoTextField.layer.cornerRadius = 12.0
        mobileNoTextField.clipsToBounds = true
        mobileNoTextField.font = UIFont.systemFont(ofSize: 15)
        mobileNoTextField.frame = CGRect(x: 50, y: 430, width: 300, height: 50)
        return mobileNoTextField
        
    }()
    private let emailTextField:UITextField={
        let emailTextField = UITextField()
        emailTextField.placeholder = "Your email..."
        emailTextField.textAlignment = .left
        emailTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        emailTextField.textColor = .white
        emailTextField.layer.cornerRadius = 12.0
        emailTextField.clipsToBounds = true
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.frame = CGRect(x: 50, y: 530, width: 300, height: 50)
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
        passwordTextField.frame = CGRect(x: 50, y: 630, width: 300, height: 50)
        return passwordTextField
        
    }()
    
override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "signin")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.alpha = 0.1
        view.addSubview(backgroundImageView)
        
        let signUpLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 120))
        signUpLabel.text = "Sign up to Register"
        signUpLabel.textAlignment = .center
        signUpLabel.textColor = .red
        signUpLabel.numberOfLines = 3
        signUpLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        let subLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 300, height: 80))
        subLabel.text = "Welcome back! Please enter your details to register yourself."
        subLabel.textAlignment = .center
        subLabel.textColor = .white
        subLabel.numberOfLines = 3
        subLabel.font = UIFont.systemFont(ofSize: 20)
        
        let nameLabel = UILabel(frame: CGRect(x: 150, y: 270, width: 80, height: 80))
        nameLabel.text = "Full Name"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let mobileNoLabel = UILabel(frame: CGRect(x: 150, y: 370, width: 80, height: 80))
        mobileNoLabel.text = "Mobile No"
        mobileNoLabel.textColor = .white
        mobileNoLabel.textAlignment = .center
        mobileNoLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let emailLabel = UILabel(frame: CGRect(x: 150, y: 470, width: 80, height: 80))
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        let passwordLabel = UILabel(frame: CGRect(x: 150, y: 570, width: 80, height: 80))
        passwordLabel.text = "Password"
        passwordLabel.textColor = .white
        passwordLabel.textAlignment = .center
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
    
        view.addSubview(signUpLabel)
        view.addSubview(subLabel)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(mobileNoLabel)
        view.addSubview(passwordLabel)
        view.addSubview(nameTextField)
        view.addSubview(mobileNoTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.frame = CGRect(x: 50, y: 710, width: 300, height: 50)
        signUpButton.backgroundColor = .red
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.borderWidth = 3.0
        signUpButton.layer.borderColor = UIColor.red.cgColor
        signUpButton.layer.cornerRadius = 12.0
        signUpButton.clipsToBounds = true
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
                
        view.addSubview(signUpButton)

     


        
        
        
        
    }
    
    
    @objc private func signUpButtonTapped() {
        guard let fullname = nameTextField.text,
                let phoneNumber = mobileNoTextField.text,
                let email = emailTextField.text,
                let password = passwordTextField.text else {
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                print("Kullanıcı kaydı hatası: \(error.localizedDescription)")
                return
            }
            
            guard let userID = authResult?.user.uid else {
                print("Kullanıcı kimliği alınamadı")
                return
            }
            
            // Kullanıcıyı veritabanına kaydetme işlemi
            let userData: [String: Any] = [
                "name": fullname,
                "phoneNumber": phoneNumber,
                "email": email
            ]
            
            Database.database().reference().child("users").child(userID).setValue(userData) { (error, _) in
                if let error = error {
                    print("Kullanıcıyı veritabanına kaydetme hatası: \(error.localizedDescription)")
                    return
                }
                
                // Kullanıcı kaydı başarılı, diğer işlemleri yapabilirsiniz
                
                DispatchQueue.main.async {
                    // Örneğin, başarılı kayıt mesajını göstermek için bir UIAlertController kullanabilirsiniz
                    let alertController = UIAlertController(title: "Başarılı", message: "Kullanıcı kaydı başarıyla tamamlandı.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self?.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    
    


}
