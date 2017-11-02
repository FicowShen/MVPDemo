//
//  MVPDemo_FicowTests.swift
//  MVPDemo-FicowTests
//
//  Created by ficow on 2017/11/2.
//  Copyright © 2017年 ficowshen. All rights reserved.
//

import XCTest
@testable import MVPDemo_Ficow

class MVPDemo_FicowTests: XCTestCase {
    
    let emptyModel:MockModel = MockModel(users:[User]())
    
    let normalModel:MockModel = MockModel(users:[User(firstName: "firstname1", lastName: "lastname1", email: "first@test.com", age: 30),
                                                     User(firstName: "firstname2", lastName: "lastname2", email: "second@test.com", age: 24)])
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        //设置正常测试数据
        var userViewMock = MockView()
        var mockPresenter = UserPresenter(userModel:normalModel)
        mockPresenter.attachView(view: userViewMock)
        
        //获取
        mockPresenter.getUsers()
        
        //验证
        XCTAssertTrue(userViewMock.setUsersCalled)
        
        
        var expect = XCTestExpectation.init(description: "expect")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            expect.fulfill()
            mockPresenter.detachView()
        }
        wait(for: [expect], timeout: 6)
        
        
        //设置空测试数据
        userViewMock = MockView()
        mockPresenter = UserPresenter(userModel: emptyModel)
        mockPresenter.attachView(view: userViewMock)
        
        //获取
        mockPresenter.getUsers()
        
        //验证
        XCTAssertTrue(userViewMock.setEmptyUsersCalled)
        
        expect = XCTestExpectation.init(description: "expect")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            expect.fulfill()
            mockPresenter.detachView()
        }
        wait(for: [expect], timeout: 6)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
