//
//  ModelRegister.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation
import UIKit
import Firebase

class ModelMainRegister {
    
    func Register(vc:UIViewController,viewMain:UIView,strEmail:String,StrPassword:String,compeletion:@escaping(ModelRegisterData) -> Void) {
        
        var responseModel = ModelRegisterData()
                Auth.auth().createUser(withEmail:strEmail, password: StrPassword) { (authResult, error) in
            if let error = error as NSError? {
                print("Error: \(error.localizedDescription)")
                responseModel.strMessage = error.localizedDescription
                compeletion(responseModel)
            } else {
                responseModel.strMessage = StringError.SuceesSigUp
                compeletion(responseModel)
            }
        }
    }
}
struct ModelRegisterData {
    var strMessage : String?
    var strEMail : String?
}
