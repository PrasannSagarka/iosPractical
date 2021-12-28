//
//  RegisterVC.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import UIKit

class RegisterVC: UIViewController {

    //MARK:- IBOutelts
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    //UiButton
    @IBOutlet weak var btnSignUp: UIButton!
    
    //MARK:- deClaration
    let objLogin = ModelMainRegister()
    
    //Bool
    var isEmail = Bool()
    var isPassword = Bool()
    
    //MARK:- ViewController_LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.btnSignUp.isEnabled = false
        self.btnSignUp.alpha = 0.5
    }
    //MARK:- CustomFunction
    func FuncSigup()  {
        if tfEmail.text == "" {
            globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:StringError.ErrorEmailEmpty)
        } else if tfPassword.text == "" {
            globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:StringError.ErrorPasswordEmpty)
        } else {
            objLogin.Register(vc:self, viewMain:self.view, strEmail:tfEmail.text ?? "", StrPassword:tfPassword.text ?? "") { (modelData) in
                if modelData.strMessage == StringError.SuceesSigUp {
                    funcSetRootView(identifier:"Login", isDelay:false)
                } else {
                    globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:modelData.strMessage ?? "")
                }
            }
        }
    }
    
    //MARK:- IBAction
    @IBAction func btnActionSignIn(_ sender: Any) {
        self.navigationController?.popViewController(animated:true)
    }
    @IBAction func btnActionSignUp(_ sender: Any) {
        self.FuncSigup()
    }
}
//MARK:- TextFieldDElegete
extension RegisterVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfEmail {
            tfPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfEmail {
            if validation.isValidEmail(emailStr:tfEmail.text ?? "") == true {
                self.isEmail = true
            } else {
                self.isEmail = false
            }
        }
        if textField == tfPassword {
            if validation.isValidPassword(testStr:self.tfPassword.text ?? "") == true {
                self.isPassword = true
            } else {
                self.isPassword = false
            }
        }
        if isEmail == true && isPassword == true {
            self.btnSignUp.isEnabled = true
            self.btnSignUp.alpha = 1.0
        } else {
            self.btnSignUp.isEnabled = false
            self.btnSignUp.alpha = 0.5
        }
        return true
    }
}
