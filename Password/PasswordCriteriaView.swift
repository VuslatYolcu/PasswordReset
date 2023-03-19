//
//  PasswordCriteriaView.swift
//  Password
//
//  Created by Vuslat Yolcu on 19.03.2023.
//

import Foundation
import UIKit

class PasswordCriteriaView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}

extension PasswordCriteriaView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    func layout() {
        
    }
}
