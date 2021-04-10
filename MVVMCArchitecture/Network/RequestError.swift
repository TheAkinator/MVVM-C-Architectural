//
//  GitHubAPIError.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

enum RequestError: Error {
    case badURL
    case requestFailed(Int)
    case underlying(Error)
    case emptyResponse
}
