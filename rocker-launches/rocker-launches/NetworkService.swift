//
//  NetworkService.swift
//  rocker-launches
//
//  Created by Carlos Paredes on 29/8/23.
//

import Apollo
import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private(set) var apollo = ApolloClient(url: URL(string: "https://spacex-production.up.railway.app/")!)
    
    private init() { }
}
