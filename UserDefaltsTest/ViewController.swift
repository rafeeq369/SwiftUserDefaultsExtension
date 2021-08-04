
import UIKit

struct User: Codable{
    var FirstName: String?
    var LastName: String?
}

class ViewController: UIViewController {

    @IBOutlet weak var Switch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = UserDefaults.standard.swithIsOn
        UpdateBackground(IsOn: isOn)
//        
        let user = User(FirstName: "Rafeeq", LastName: "Rahman")
//        UserDefaults.standard.signedInUser = user
        print("Sihned in user is: \(UserDefaults.standard.signedInUser)")
    }


    @IBAction func BgColorToggler(_ sender: UISwitch) {
        UpdateBackground(IsOn: sender.isOn)
        UserDefaults.standard.swithIsOn = sender.isOn
        
    }
    
    private func UpdateBackground(IsOn: Bool) {
        self.view.backgroundColor = IsOn ? .orange : .darkGray
        self.Switch.isOn = IsOn
    }
}

