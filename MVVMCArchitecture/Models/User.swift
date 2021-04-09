//
//  User.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
