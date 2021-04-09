//
//  GitHubAPIRouter.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

enum GitHubAPIRoutes {
    case users([GitHubAPIParameter])
    case user([GitHubAPIParameter])

    var path: String {
        switch self {
        case .users:
            return "/users"
        case .user:
            return "/user"
        }
    }

    var baseURL: String {
        "https://api.github.com"
    }

    var method: String {
        switch self {
        default:
            return "GET"
        }
    }

    var url: URL? {
        switch self {
        case .users(let parameters):
            return url(path: path, parameters: parameters)
        case .user(let parameters):
            return url(path: path, parameters: parameters)
        }
    }

    private func url(path: String, parameters: [GitHubAPIParameter]) -> URL? {
        guard var urlComponents = URLComponents(string: baseURL) else {
            fatalError("Invalid URL to create URLComponents")
        }

        urlComponents.path = path

        let queryItems = parameters.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        urlComponents.queryItems = queryItems

        return urlComponents.url
    }
}
