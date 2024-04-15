//
//  ApiService.swift
//  MP Papers
//
//  Created by techstalwarts on 30/11/23.
//

import Foundation
import Combine

protocol ApiServiceProtocol {
    func getPhotos(request: PhotoRequestModel) -> AnyPublisher<[PhotoResponseModel], Error>
}

class ApiService: ApiServiceProtocol {
    
    func getPhotos(request: PhotoRequestModel) -> AnyPublisher<[PhotoResponseModel], Error> {
        apiClient.request(.getPhotos(request))
    }
    
    let apiClient = URLSessionAPIClient<NetworkUtils>()
    
}
