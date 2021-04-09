//
//  AccountCell.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

final class AccountCell: BaseUITableViewCell {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    func setupUser(_ user: User) {
        nameLabel.text = user.login
    }

    private func setupViews() {
        addSubview(nameLabel)

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self).offset(16)
            make.trailing.equalTo(self).offset(16)
            make.bottom.equalTo(self)
            make.height.equalTo(60).priority(.high)
        }
    }
}
