//
//  UITextField+Extention.swift
//  Minutes
//
//  Created by Desarrollo on 5/8/19.
//  Copyright © 2019 Microsoft. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    override open func copy(_ sender: Any?)  {
        AppDelegate.customPasteboard?.string = self.text
    }
    
    override open func paste(_ sender: Any?) {
        if let text = AppDelegate.customPasteboard?.string {
            self.text = text
        }
    }
    override open func cut(_ sender: Any?) {
        AppDelegate.customPasteboard?.string = self.text
        self.text = nil
    }
}
