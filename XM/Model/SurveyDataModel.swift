//
//  SurveyDataModel.swift
//  XM
//
//  Created by Norman, ThankaVijay on 24/09/22.
//

import Foundation

final class SurveyDataModel {

    let id: Int
    let question: String
    var answer: String

    internal init(id: Int, question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
}
