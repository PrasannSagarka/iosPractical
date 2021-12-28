//
//  ModelLogin.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation
import UIKit
import Firebase

class ModelMainLogin {
    func Login(vc:UIViewController,viewMain:UIView,strEmail:String,StrPassword:String,compeletion:@escaping(ModelLoginData) -> Void) {
        
        var responseModel = ModelLoginData()
        
        Auth.auth().signIn(withEmail: strEmail, password: StrPassword) { (authResult, error) in
            if let error = error as NSError? {
                print("Error: \(error.localizedDescription)")
                responseModel.strMessage = error.localizedDescription
                compeletion(responseModel)
            } else {
                let userInfo = Auth.auth().currentUser
                let email = userInfo?.email
                responseModel.strMessage = StringError.SucessSigIn
                responseModel.strEMail = email
                compeletion(responseModel)
            }
        }
    }
}
struct ModelLoginData {
    var strMessage : String?
    var strEMail : String?
}
