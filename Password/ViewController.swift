//
//  ViewController.swift
//  Password
//
//  Created by Vuslat Yolcu on 18.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        
        view.addSubview(newPasswordTextField)
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            newPasswordTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: newPasswordTextField.trailingAnchor, multiplier: 1),
            newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
