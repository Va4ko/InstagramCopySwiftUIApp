//
//  Extensions.swift
//  InstagramCopy
//
//  Created by Vachko on 31.03.21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
