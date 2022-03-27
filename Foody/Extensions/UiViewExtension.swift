//
//  UiViewExtension.swift
//  Foody
//
//  Created by THANSEEF on 15/03/22.
//

import UIKit

//to expand the existing uiview field features
extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
