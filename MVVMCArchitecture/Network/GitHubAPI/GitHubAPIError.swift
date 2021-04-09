//
//  GitHubAPIError.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

enum GitHubAPIError: Error {
    case badURL
    case badResponse
    case noData
}
