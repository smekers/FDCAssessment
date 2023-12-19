//
//  NetworkManager.swift
//  FDCAssessment
//
//  Created by d on 12/19/23.
//

import Foundation
import Alamofire
import Combine

class NetworkManager {
    static var shared = NetworkManager()
    func getCountries() -> AnyPublisher<[Countries], AFError> {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        return AF.request("https://restcountries.com/v3.1/all", method: .get)
            .validate()
            .publishDecodable(type:[Countries].self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
           

    }
    

}


struct Countries: Decodable {
    var region: String
    var name: CountryName
}

struct CountryName: Decodable {
    var common: String
    var official: String
}
