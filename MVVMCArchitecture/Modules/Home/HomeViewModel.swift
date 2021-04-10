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
    let users = BehaviorSubject<[User]>(value: [])

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
                self.users.onNext(users)
                self.users.onCompleted()
            case .failure(let error):
                self.users.onError(error)
            }
        }
    }

    func viewModelFor(user: User) -> UserCellViewModel {
        UserCellViewModel(user: user)
    }
}
