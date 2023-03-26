//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Vuslat Yolcu on 25.03.2023.
//

import XCTest

@testable import Password

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_Inline: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }

    /*
     if shouldResetCriteria {
         // Inline validation (✅ or ⚪️)
     } else {
         ...
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }

    /*
     if shouldResetCriteria {
         ...
     } else {
         // Focus lost (✅ or ❌)
     }
     */

    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }

    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_Three_Of_Four_Conditions: XCTestCase {
    
    var statusView: PasswordStatusView!
    
    let validPassword = "12345678Aa!"
    
    let shortPassword = "A"
    let spacedPassword = "12122 343"
    let noUppercasePassword = "12345678aa!"
    let noLowercasePassword = "12345678AA!"
    let noSpecialCharacterAndNoUppercasePassword = "12345678aaa"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    
    func testValidPassword() throws {
        XCTAssertTrue(statusView.validate(validPassword))
    }

    func testTooShort() throws {
        XCTAssertFalse(statusView.validate(shortPassword))
    }
    
    func testNoSpaceConditionNotMet() throws {
        XCTAssertFalse(statusView.validate(spacedPassword))
    }
    
    func testOnlyUppercaseNotMet() throws {
        XCTAssertTrue(statusView.validate(noUppercasePassword))
    }
    
    func testOnlyLowercasecaseNotMet() throws {
        XCTAssertTrue(statusView.validate(noLowercasePassword))
    }
    
    func testNoSpecialCharacterAndNoUppercaseNotMet() throws {
        XCTAssertFalse(statusView.validate(noSpecialCharacterAndNoUppercasePassword))
    }
    
}
