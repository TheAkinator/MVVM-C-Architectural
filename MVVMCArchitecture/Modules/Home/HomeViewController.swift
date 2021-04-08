//
//  HomeViewController.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 05/04/21.
//

import UIKit

final class HomeViewController: UIViewController {
    private var viewModel: HomeViewModel

    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
        return button
    }()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .red
        view.addSubview(detailButton)
        detailButton.snp.makeConstraints { make -> Void in
            make.center.equalTo(view)
        }
    }

    @objc private func didTapDetails() {
        viewModel.didTapDetail()
    }
}
