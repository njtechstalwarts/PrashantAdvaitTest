//
//  NetworkUtils.swift
//  MP Papers
//
//  Created by techstalwarts on 30/11/23.
//

import Foundation
import SwiftUI

protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum NetworkUtils: APIEndpoint {
        
    case getPhotos(_ request: PhotoRequestModel)
    
    var path: String {
        switch self {
        case .getPhotos: return ApiNames.getPhotos.rawValue
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getPhotos: return .get
        }
    }

    var headers: [String: String]? {

        return [:]
    }

    var parameters: [String: Any]? {
        switch self {
        case .getPhotos(let value): return value.asDictionary()
        }
    }
}
