//
//  LoginVC.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK:- IBOutelts
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!

    //MARK:- ViewController_LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- CustomFunction
    
    
    //MARK:- IBAction
    @IBAction func btnActionSignIn(_ sender: Any) {
        
    }
    @IBAction func btnActionSignUp(_ sender: Any) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier:"RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(objRegister, animated:true)
    }
}
//MARK:- TextFieldDElegete
extension LoginVC : UITextFieldDelegate {
    
}
