//
//  HomeViewModel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import Foundation
import RxSwift

final class HomeViewModel {
    private let githubAPI: GitHubAPIServicesProtocol
    weak var coordinator: HomeCoordinator?

    var dateString = BehaviorSubject<String>(value: "")
    let accounts = BehaviorSubject<[User]>(value: [])

    init(
        coordinator: HomeCoordinator,
        githubAPI: GitHubAPIServicesProtocol = GitHubAPIServices()
    ) {
        self.coordinator = coordinator
        self.githubAPI = githubAPI
    }

    func didTapCell(for indexPath: IndexPath) {
//        let account = try? accounts.value()[indexPath.row]
//        print(account?.userName)
        coordinator?.navigateToDetail()
    }

    func fetchAccountsList() {
        githubAPI.getUsers(since: 0) { result in
            switch result {
            case .success(let users):
                self.accounts.onNext(users)
                self.accounts.onCompleted()
            case .failure(let error):
                self.accounts.onError(error)
            }
        }
    }
}
