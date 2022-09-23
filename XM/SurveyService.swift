//
//  SurveySevice.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation
import ServiceHandler

protocol SurveyServicing {
    func fetch() async throws -> [SurveyDataModel]
    func submit(answer: String, for id: Int) async throws -> Bool
}

class SurveyService: SurveyServicing {
    private let service: NetworkServiable

    init(service: NetworkServiable) {
        self.service = service
    }

    func fetch() async throws -> [SurveyDataModel] {
        let response = try await service.fetch(request: Requests.StartSurvey.questions())
        let result = response.map {
            SurveyDataModel(id: $0.id, question: $0.question, answer: "")
        }
        return result
    }

    func submit(answer: String, for id: Int) async throws -> Bool {
        let result = try await service.fetch(request: Requests.StartSurvey.submit(answer: answer, id: id))
        return result == "" ? true : false
    }
}

class SurveyDataModel {

    let id: Int
    let question: String
    var answer: String

    internal init(id: Int, question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
}
