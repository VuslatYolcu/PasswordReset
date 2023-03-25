//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Vuslat Yolcu on 25.03.2023.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws { // 33
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws { // 8
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws { // 32
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("ab c"))
    }
    
    // lengthAndNoSpaceMet
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("123456"))
    }
    
    func testLengthAndNoSpaceNotMet2() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234568 9"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    // uppercaseMet
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("123Aasdad"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("123aasdad"))
    }
    
    // lowercaseMet
    func testlowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("123AaSADNALSD"))
    }
    
    func testLowercaseMetcaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("123A"))
    }
    
    // digitMet
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("123asdas"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("sadassadA"))
    }
    
    // specialCharacterMet
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("123asdas"))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("sada%ssadA"))
    }
}




