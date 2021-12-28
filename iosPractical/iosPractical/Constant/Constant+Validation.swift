//
//  Constant+Validation.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation

struct validation {
    
    static func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let check = emailPred.evaluate(with:emailStr)
        return check
    }
    
    static func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,16}")
        return passwordTest.evaluate(with: testStr)
    }
}
