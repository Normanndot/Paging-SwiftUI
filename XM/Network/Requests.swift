//
//  Requests.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation
import ServiceHandler

struct Requests {
    struct StartSurvey {
        static func questions() -> Request<[Survey]> {
            .init(url: .init(path: "/questions")!, httpMethod: .get)
        }

        static func submit(answer: String, id: Int) -> Request<String> {
            .init(url: .init(path: "/question/submit")!, httpMethod: .post(Answer(id: id, question: answer)))
        }
    }
}
