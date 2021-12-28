//
//  Extension+ViewController.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation
import UIKit

func funcSetRootView(identifier:String,isDelay:Bool) {
    if isDelay == true {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){ // change your delay here
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let obj = mainStoryBoard.instantiateViewController(withIdentifier:identifier) as! UINavigationController
            UIApplication.shared.windows.first?.rootViewController = obj
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    } else {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let obj = mainStoryBoard.instantiateViewController(withIdentifier:identifier) as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = obj
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
