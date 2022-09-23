//
//  XMTests.swift
//  XMTests
//
//  Created by Norman, ThankaVijay on 21/09/22.
//

import XCTest
@testable import XM

final class XMTests: XCTestCase {
    let surveys: [SurveyDataModel] = [.init(id: 1, question: "Question1", answer: "Answer1"),
                                      .init(id: 1, question: "Question2", answer: "Answer2"),
                                      .init(id: 1, question: "Question3", answer: "Answer3")]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor func testInitialIndexValue() throws {
        let viewModelFactory = ViewModelFactory()
        let vm = viewModelFactory.surveyViewModel()
        vm.surveys = surveys
        XCTAssert(vm.index == 0)
    }

    @MainActor func testInitialQuestion() throws {
        let viewModelFactory = ViewModelFactory()
        let vm = viewModelFactory.surveyViewModel()
        vm.surveys = surveys
        XCTAssert(vm.currentQuestion == "Wait for the Question...")
    }

    @MainActor func testNextQuestion() {
        let viewModelFactory = ViewModelFactory()
        let vm = viewModelFactory.surveyViewModel()
        vm.surveys = surveys
        vm.nextQuestion()
        XCTAssert(vm.currentQuestion == "Question2")
    }

    @MainActor func testInitialAnswer() {
        let viewModelFactory = ViewModelFactory()
        let vm = viewModelFactory.surveyViewModel()
        vm.surveys = surveys
        XCTAssert(vm.currentAnswer == "Type Your Answer here...")
    }

    @MainActor func testNextAnswer() {
        let viewModelFactory = ViewModelFactory()
        let vm = viewModelFactory.surveyViewModel()
        vm.surveys = surveys
        vm.nextQuestion()
        XCTAssert(vm.currentAnswer == "Answer2")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
