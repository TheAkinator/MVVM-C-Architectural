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

    var dateString = PublishSubject<String>()

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    func didTapDetail() {
        dateString.on(.next("\(Date())"))
//        coordinator?.navigateToDetail()
    }
}
