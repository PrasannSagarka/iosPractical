//
//  Constant+Alert.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation
import UIKit

struct globalAlert {
    static func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
        }))
        vc.present(alert, animated: true, completion: nil)
    }
}
