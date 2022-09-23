//
//  URL+Extension.swift
//  XM
//
//  Created by Norman, ThankaVijay on 23/09/22.
//

import Foundation

extension URL {
    init?(path: String) {
        guard var urlComponents = URLComponents(string: ApiConstants.baseUrl) else { return nil }
        urlComponents.path = path
        guard let url = urlComponents.url else { return nil }
        self = url
    }
}
