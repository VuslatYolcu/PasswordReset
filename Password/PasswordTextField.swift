//
//  PasswordTextField.swift
//  Password
//
//  Created by Vuslat Yolcu on 18.03.2023.
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension PasswordTextField {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemOrange
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(lockImageView)
        
        // Lock Image view
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        ])
    }
}
