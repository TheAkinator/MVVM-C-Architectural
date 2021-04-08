//
//  HomeViewController.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 05/04/21.
//

import RxCocoa
import RxSwift
import UIKit


final class HomeViewController: BaseViewController {
    private var viewModel: HomeViewModel
    private let disposeBag = DisposeBag()

    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("Detail", for: .normal)
        button.rx.tap.bind { self.viewModel.didTapDetail() }.disposed(by: disposeBag)
        return button
    }()

    private lazy var label: BindableLabel = {
        let label = BindableLabel()
        label.bindValue = viewModel.dateString
        label.textColor = .white
        return label
    }()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
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

        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin)
            make.width.equalTo(400)
            make.height.equalTo(50)
        }
    }
}
