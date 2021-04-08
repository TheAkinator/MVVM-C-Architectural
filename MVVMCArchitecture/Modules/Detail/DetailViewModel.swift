//
//  DetailViewModel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import Foundation

final class DetailViewModel {
    weak var coordinator: DetailCoordinator?

    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
    }

    func finish() {
        coordinator?.finish()
    }
}
