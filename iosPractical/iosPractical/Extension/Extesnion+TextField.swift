//
//  Extesnion+TextField.swift
//  iosPractical
//
//  Created by Jaydeep on 28/12/21.
//

import Foundation
import UIKit

private var __maxLengths = [UITextField: Int]()
var defaultLenghth = 150

extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return defaultLenghth
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(MaxVal), for: .editingChanged)
        }
    }
    @objc func MaxVal(textField: UITextField) {
        let t = textField.text
        if maxLength < 0 {
            maxLength = defaultLenghth
        }
        textField.text = String((t?.prefix(maxLength))!)
    }
}
