//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Vuslat Yolcu on 26.03.2023.
//

import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }

    /*
     Here we trigger those criteria blocks by entering text,
     clicking the reset password button, and then checking
     the error label text for the right message.
     */
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = "12345 asda"
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = "a"
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Your password must meet the requirements below")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = "12345678Aa!"
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "")
    }
}
