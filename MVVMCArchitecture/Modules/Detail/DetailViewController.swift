//
//  DetailViewController.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import SnapKit
import UIKit

final class DetailViewController: UIViewController {
    private var viewModel: DetailViewModel

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(finish), for: .touchUpInside)
        return button
    }()

    init(viewModel: DetailViewModel) {
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
        view.backgroundColor = .blue
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make -> Void in
            make.center.equalTo(view)
        }
    }

    @objc private func finish() {
        viewModel.finish()
    }
}
