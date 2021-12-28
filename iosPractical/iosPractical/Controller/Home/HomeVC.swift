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
    override func viewWillAppear(_ animated: Bool) {
        self.FuncSetData()
    }
    
    //MARK:- CustomFunction
    func FuncSetData() {
        if let stremail = UserDefaults.standard.object(forKey:UDefault.Email) {
            self.lblWelcome.text = "Welcome " + "\(stremail)"
        } else {
            self.lblWelcome.text = "User not found please logout !"
        }
    }
    func FuncLogOut() {
        let refreshAlert = UIAlertController(title:StringError.AppName , message: "All you sure want to logout ?", preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                UserDefaults.standard.removeObject(forKey:UDefault.Email)
                UserDefaults.standard.setValue(false, forKey:UDefault.Login)
                funcSetRootView(identifier:"Login", isDelay:false)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              
        }))

        present(refreshAlert, animated: true, completion: nil)
    }
    
    //MARK:- IBaction
    @IBAction func btnActionLogout(_ sender: Any) {
        self.FuncLogOut()
    }
}
