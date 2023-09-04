//
//  FriendViewControllerTests.swift
//  GB_HW_Swift
//
//  Created by Alina on 23.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import XCTest

class FriendViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testTapOnFriendCell_ShouldPushProfileViewController() {
        
        let friendCell = app.tables.cells.element(boundBy: 0)
        
        friendCell.tap()
        
        XCTAssertTrue(app.navigationBars["Profile"].exists)
    }
    
    // Тестируем метод получения друзей
    func testGetFriends() {
        // Задаем ожидаемый результат
        let expectedFriends = [Friend(name: "John"), Friend(name: "Alice")]
        mockNetworkService.friends = expectedFriends
        
        // Вызываем метод
        sut.getFriends()
        
        // Проверяем, что модели друзей были обновлены
        XCTAssertEqual(sut.models, expectedFriends)
        
        // Проверяем, что метод добавления друзей в кэш был вызван
        XCTAssertTrue(mockFileCache.addFriendsCalled)
        
        // Проверяем, что метод reloadData() был вызван на главном потоке
        XCTAssertTrue(mockMainDispatchQueue.asyncCalled)
    }}
