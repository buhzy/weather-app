//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Admin on 08/02/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
@IBDesignable
class WeatherButton: UIButton {

    @IBInspectable var BorderWidth:CGFloat = 0 {
    didSet{
        self.layer.borderWidth = BorderWidth
    }
}
    @IBInspectable var BorderColor:UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = BorderColor.cgColor
        }
   }
    @IBInspectable var CornerRadius:CGFloat = 0{
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
    }
}
