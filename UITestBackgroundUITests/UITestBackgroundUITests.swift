//
//  UITestBackgroundUITests.swift
//  UITestBackgroundUITests
//
//  Created by Masi, Ennio (Senior iOS Developer) on 23/05/2017.
//  Copyright © 2017 Ennio Masi. All rights reserved.
//

import XCTest

@available(iOS 10.3, *)
class UITestBackgroundUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testMainNavigationFromScratch() {
        let app = XCUIApplication()
        app.buttons["mainBtnAccId"].tap()
        app.alerts["test"].buttons["oK"].tap()
    }
    
    func testMainNavigationFromBackground() {
        XCUIDevice.shared().press(XCUIDeviceButton.home)
        
        let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        XCUIDevice.shared().siriService.activate(voiceRecognitionText: "open \(appName) app")

        sleep(3)
        
        self.checkUI()
    }
    
    private func checkUI() {
        let app = XCUIApplication()
        app.buttons["mainBtnAccId"].tap()
        app.navigationBars["UIView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
