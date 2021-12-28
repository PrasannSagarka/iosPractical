//
//  HomeVC.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK:- IBOutlets
    //UiLAbel
    @IBOutlet weak var lblWelcome: UILabel!
    
    //MARK:- ViewController_LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- CustomFunction
    func FuncSetData() {
        if let stremail = UserDefaults.standard.object(forKey:"email") {
            self.lblWelcome.text = "Welcome " + "\(stremail)"
        } else {
            self.lblWelcome.text = "User not found please logout !"
        }
    }
    
    //MARK:- IBaction
    @IBAction func btnActionLogout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey:"email")
        UserDefaults.standard.setValue(false, forKey:"Login")
        funcSetRootView(identifier:"Login", isDelay:false)
    }
    
}
