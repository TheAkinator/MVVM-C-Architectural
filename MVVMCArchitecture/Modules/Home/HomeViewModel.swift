//
//  HomeViewModel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import Foundation
import RxSwift

final class HomeViewModel {
    weak var coordinator: HomeCoordinator?

    var dateString = BehaviorSubject<String>(value: "")
    let accounts = BehaviorSubject<[Account]>(value: [])

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    func didTapCell(for indexPath: IndexPath) {
//        let account = try? accounts.value()[indexPath.row]
//        print(account?.userName)
        coordinator?.navigateToDetail()
    }

    func fetchAccountsList() {
        let accountsArray = [
            Account(userName: "John", numberOfRepos: 1),
            Account(userName: "Take", numberOfRepos: 4),
            Account(userName: "Miles", numberOfRepos: 9),
            Account(userName: "Beth", numberOfRepos: 90),
            Account(userName: "Mike", numberOfRepos: 33)
        ]

        accounts.onNext(accountsArray)
        accounts.onCompleted()
    }
}
