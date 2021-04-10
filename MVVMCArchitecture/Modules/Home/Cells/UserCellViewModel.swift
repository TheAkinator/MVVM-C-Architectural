//
//  UserCellViewModel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 10/04/21.
//

import Foundation

final class UserCellViewModel {
    private let imageFetcher: ImageFetcherProtocol
    let user: User

    init(user: User, imageFetcher: ImageFetcherProtocol = ImageFetcher()) {
        self.user = user
        self.imageFetcher = imageFetcher
    }

    func fetchImage(completion: @escaping (Result<Data, RequestError>) -> Void) {
        guard let url = URL(string: user.avatarURL) else { return }
        imageFetcher.fetchImage(at: url, completion: completion)
    }
}
