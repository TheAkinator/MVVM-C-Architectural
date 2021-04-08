//
//  HomeCoordinator.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

final class HomeCoordinator: BasicCoordinator {
    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.viewControllers = [viewController]

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func navigateToDetail() {
        let coordinator = DetailCoordinator()
        start(coordinator: coordinator)
    }
}
