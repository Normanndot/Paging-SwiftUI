//
//  SurveyViewModel.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation
import ServiceHandler

@MainActor
class SurveyViewModel: ObservableObject {
    private let surveyService: SurveyServicing

    @Published var surveys: [SurveyDataModel]?
    @Published var errorMessage: String?
    @Published var totalSubmission: Int = 0
    var index: Int = 0
    @Published var currentQuestion: String = "Wait for the Question..."
    @Published var currentAnswer: String = "Type Your Answer here..."

    init(service: SurveyServicing) {
        self.surveyService = service
    }

    func fetchSurveyQuestions() async {
        do {
            self.surveys = try await surveyService.fetch()
            update()
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func submit(answer: String) async {
        do {
            let result = try await surveyService.submit(answer: answer, for: surveys?[index].id ?? 0)
            surveys?[index].answer = answer
            update()
            if result == true {
                totalSubmission += 1
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func nextQuestion() {
        if (surveys?.count ?? 0) > index + 1 {
            index += 1
            update()
        }
    }

    func previousQuestion() {
        if index > 0 {
            index -= 1
            update()
        }
    }

    private func update() {
        currentQuestion = surveys?[index].question ?? ""
        currentAnswer = surveys?[index].answer ?? ""
    }

}
