//
//  GitHubAPIParameter.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

enum GitHubAPIParameter {
    case since(Int)
    case perPage(Int)

    var key: String {
        switch self {
        case .perPage:
            return "per_page"
        default:
            guard let label = Mirror(reflecting: self).children.first?.label else {
                return .init(describing: self)
            }
            return label
        }
    }

    var value: String {
        switch self {
        case .since(let value):
            return String(value)
        case .perPage(let value):
            return String(value)
        }
    }
}
