//
//  LoginVC.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK:- IBOutelts
    //UiTextfield
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    //UiButton
    @IBOutlet weak var btnSignIn: UIButton!
    
    //MARK:- deClaration
    //Model
    let objLogin = ModelMainLogin()
    
    //Bool
    var isEmail = Bool()
    var isPassword = Bool()
    
    //MARK:- ViewController_LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.btnSignIn.isEnabled = false
        self.btnSignIn.alpha = 0.5
        self.FuncCheckLogin()
    }
    
    //MARK:- CustomFunction
    func FuncSigin()  {
        if tfEmail.text == "" {
            globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:StringError.ErrorEmailEmpty)
        } else if tfPassword.text == "" {globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:StringError.ErrorPasswordEmpty)
        } else {
            objLogin.Login(vc:self, viewMain:self.view, strEmail:tfEmail.text ?? "", StrPassword:tfPassword.text ?? "") { (modelData) in
             //   funcSetRootView(identifier:"Home", isDelay:false)
                if modelData.strMessage == StringError.SucessSigIn {
                    UserDefaults.standard.setValue(true, forKey:UDefault.Login)
                    UserDefaults.standard.setValue(modelData.strEMail ?? "", forKey:UDefault.Email)
                    funcSetRootView(identifier:"Home", isDelay:false)
                } else {
                    globalAlert.showAlertMessage(vc:self, titleStr:StringError.AppName, messageStr:modelData.strMessage ?? "")
                }
            }
        }
    }
    func FuncCheckLogin() {
        if let checkLogin = UserDefaults.standard.object(forKey:UDefault.Login) as? Bool {
            if checkLogin == true {
                funcSetRootView(identifier:"Home", isDelay:false)
            }
        }
    }
    
    //MARK:- IBAction
    @IBAction func btnActionSignIn(_ sender: Any) {
        self.FuncSigin()
    }
    @IBAction func btnActionSignUp(_ sender: Any) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier:"RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(objRegister, animated:true)
    }
}
//MARK:- TextFieldDElegete
extension LoginVC : UITextFieldDelegate {
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
            self.btnSignIn.isEnabled = true
            self.btnSignIn.alpha = 1.0
        } else {
            self.btnSignIn.isEnabled = false
            self.btnSignIn.alpha = 0.5
        }
        return true
    }
}
