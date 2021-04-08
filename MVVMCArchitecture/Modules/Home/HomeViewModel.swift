//
//  HomeViewModel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import Foundation

final class HomeViewModel {
    weak var coordinator: HomeCoordinator?

    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }

    func didTapDetail() {
        coordinator?.navigateToDetail()
    }
}
