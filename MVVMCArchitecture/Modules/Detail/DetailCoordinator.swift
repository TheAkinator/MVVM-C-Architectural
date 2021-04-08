//
//  DetailCoordinator.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

final class DetailCoordinator: BasicCoordinator {
    override func start() {
        let viewModel = DetailViewModel(coordinator: self)
        let viewController = DetailViewController(viewModel: viewModel)
//        navigationController.delegate = self
//        navigationController.pushViewController(viewController, animated: true)
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
