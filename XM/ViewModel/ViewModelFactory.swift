//
//  ViewModelFactory.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation
import ServiceHandler

class ViewModelFactory {
    private lazy var service: NetworkServiable = {
        NetworkService()
    }()

    @MainActor
    func surveyViewModel() -> SurveyViewModel {
        SurveyViewModel(service: SurveyService(service: service))
    }
}
