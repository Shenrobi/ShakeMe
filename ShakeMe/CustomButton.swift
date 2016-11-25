//
//  CustomButton.swift
//  ShakeMe
//
//  Created by Terrell Robinson on 11/4/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            setupView()
        }
        
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        
    }

}
