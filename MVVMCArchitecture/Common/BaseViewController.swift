//
//  BaseViewController.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

class BaseViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
