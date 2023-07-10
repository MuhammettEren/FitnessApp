import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "giris")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.alpha = 0.1
        view.addSubview(backgroundImageView)
        
        let continueButton = UIButton(type: .system)
        continueButton.setTitle("CONTINUE", for: .normal)
        continueButton.frame = CGRect(x: 50, y: 500, width: 300, height: 50)
        continueButton.backgroundColor = .red
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.borderWidth = 3.0
        continueButton.layer.borderColor = UIColor.red.cgColor
        continueButton.layer.cornerRadius = 12.0
        continueButton.clipsToBounds = true
        continueButton.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
        view.addSubview(continueButton)
        
        
        let label = UILabel(frame: CGRect(x: 50, y: 300, width: 300, height: 80))
        label.text = "Welcome to Getfit"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 35)
        
        let subLabel = UILabel(frame: CGRect(x: 50, y: 350, width: 300, height: 80))
        subLabel.text = "Discover the best shape of your body."
        subLabel.textColor = .white
        subLabel.textAlignment = .center
        subLabel.font = UIFont.systemFont(ofSize: 15)
    
        let signInOutLabel = UILabel(frame: CGRect(x: 50, y: 540, width: 300, height: 80))
        signInOutLabel.text = "Don’t have an account? Sign Up for free"
        signInOutLabel.textColor = .red
        signInOutLabel.textAlignment = .center
        signInOutLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        view.addSubview(signInOutLabel)
        view.addSubview(subLabel)
        view.addSubview(label)
    }
    
    @objc private func didTapContinueButton(){
       let vc = SignInOutViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
}
