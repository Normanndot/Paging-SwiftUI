//
//  SurveyModel.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation

struct Survey: Decodable, Identifiable {
    let id: Int
    let question: String
}

struct Answer: Encodable, Identifiable {
    let id: Int
    let question: String
}
