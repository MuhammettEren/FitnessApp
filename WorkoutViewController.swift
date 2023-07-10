import UIKit
class WorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "WORKOUTS"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .red
        titleLabel.frame = CGRect(x: 15, y: 80, width: 200, height: 70)
        return titleLabel
    }()
    
    struct Workout {
        var name: String
        var image: String
    }
    
    let workouts = [
        Workout(name: "KARDIO", image: "kardio"),
        Workout(name: "CHEST", image: "gogus"),
        Workout(name: "DUMBELL", image: "kol2"),
        Workout(name: "ARMS", image: "kol"),
        Workout(name: "ABS", image: "abs"),
        Workout(name: "LEGS", image: "bacak"),
        Workout(name: "SHOULDER", image: "omuz"),
        Workout(name: "BACK", image: "sırt")
    ]
    
    let tableView = UITableView()
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: titleLabel.frame.maxY, width: view.bounds.width, height: view.bounds.height - titleLabel.frame.maxY)
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellIdentifier)
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        
        
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        let workout = workouts[indexPath.row]
        cell.workoutImage.image = UIImage(named: workout.image)
        cell.workoutName.text = workout.name
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 215
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               tableView.deselectRow(at: indexPath, animated: true)
               
               let workout = workouts[indexPath.row]
               
               switch workout.name {
               case "KARDIO":
                   let kardioVC = KardioViewController()
                   navigationController?.pushViewController(kardioVC, animated: true)
               case "CHEST":
                   let chestVC = ChestViewController()
                   navigationController?.pushViewController(chestVC, animated: true)
               case "DUMBELL":
                   let dumbellVC = DumbellViewController()
                   navigationController?.pushViewController(dumbellVC, animated: true)
               case "ARMS":
                   let armsVC = ArmsViewController()
                   navigationController?.pushViewController(armsVC, animated: true)
               case "ABS":
                   let absVC = AbsViewController()
                   navigationController?.pushViewController(absVC, animated: true)
               case "LEGS":
                   let legsVC = LegsViewController()
                   navigationController?.pushViewController(legsVC, animated: true)
               case "SHOULDER":
                   let shoulderVC = ShoulderViewController()
                   navigationController?.pushViewController(shoulderVC, animated: true)
               case "BACK":
                   let backVC = BackViewController()
                   navigationController?.pushViewController(backVC, animated: true)
               default:
                   break
               }
           }

        
        
    }


