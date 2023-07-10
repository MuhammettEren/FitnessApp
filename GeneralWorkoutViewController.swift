//
//  GeneralWorkoutViewController.swift
//  FitnessApp
//
//  Created by Muhammet Eren on 6.07.2023.
//

import UIKit
import FirebaseAuth
class GeneralWorkoutViewController: UIViewController {
    
    let titleLabel:UILabel = {
        let titleLabel = UILabel()
        //titleLabel.text = "Workouts"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 45)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .red
        titleLabel.frame = CGRect(x: 15, y: 50, width: 100, height: 70)
        return titleLabel
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(titleLabel)
        
        let tabBarController = UITabBarController()
        let firstVC = WorkoutViewController()
        let secondVC = DietPlanViewController()
        let thirdVC = ProfileViewController()
        
        firstVC.title = "Workouts"
        secondVC.title = "Diet Plans"
        thirdVC.title = "Profile"
        tabBarController.viewControllers = [firstVC,secondVC,thirdVC]
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
        let firstTabBarItem = UITabBarItem(title: "Workouts", image: UIImage(named: "gym"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "Diet Plans", image: UIImage(named: "diet"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 2)
        
        firstVC.tabBarItem = firstTabBarItem
        secondVC.tabBarItem = secondTabBarItem
        thirdVC.tabBarItem = thirdTabBarItem
        
        UITabBar.appearance().tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = .black
        
       
       
        }
    
 
    
        
}
