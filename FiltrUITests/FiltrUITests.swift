//
//  FiltrUITests.swift
//  FiltrUITests
//
//  Created by Rodrigo de Sousa Santos on 23/08/20.
//  Copyright © 2020 Rodrigo de Sousa Santos. All rights reserved.
//

import XCTest

class FiltrUITests: XCTestCase {
    func testContentViewElements() {
        let app = XCUIApplication()
        app.launch()
    
        let searchBtn = app.buttons["SearchButton"]
        let revertBtn = app.buttons["RevertButton"]
        let applyEffectBtn = app.buttons["ApplyEffectButton"]
        
        XCTAssertEqual(searchBtn.label, "Buscar")
        XCTAssertEqual(revertBtn.label, "arrow.counterclockwise")
        XCTAssertEqual(applyEffectBtn.label, "Aplicar Efeito")
    }
}
