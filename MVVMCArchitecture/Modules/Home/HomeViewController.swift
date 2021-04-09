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

//    private lazy var detailButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Detail", for: .normal)
//        button.rx.tap.bind { self.viewModel.didTapDetail() }.disposed(by: disposeBag)
//        return button
//    }()

    private lazy var tableView: UITableView = {
        var tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AccountCell.self)
        return tableView
    }()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupBinds()
        viewModel.fetchAccountsList()
    }

    private func setupView() {
        view.backgroundColor = .white

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.edges.equalTo(view)
        }
    }

    private func setupBinds() {
        let identifier = String(describing: AccountCell.self)
        viewModel.accounts.bind(
            to: tableView.rx.items(cellIdentifier: identifier, cellType: AccountCell.self)
        ) { _, item, cell in
            cell.setupAccount(item)
        }
        .disposed(by: disposeBag)

        tableView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                self?.viewModel.didTapCell(for: indexPath)
            })
            .disposed(by: disposeBag)
    }

    private func setupNavigationBar() {
        title = "GitHub"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
}
