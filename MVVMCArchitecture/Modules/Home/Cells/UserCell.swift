//
//  UserCell.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

final class UserCell: BaseUITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.user.login
            viewModel?.fetchImage { result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.avatar.image = image
                case .failure:
                    break
                }
            }
        }
    }

    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        if #available(iOS 13.0, *) {
            label.textColor = .label
        } else {
            label.textColor = .black
        }
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    private func setupViews() {
        addSubview(avatar)
        avatar.snp.makeConstraints { make in
            make.top.equalTo(self).inset(16)
            make.leading.equalTo(self).offset(16)
            make.bottom.equalTo(self).inset(16)
            make.height.equalTo(60).priority(.high)
            make.width.equalTo(60)
        }

        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatar)
            make.leading.equalTo(avatar.snp.trailing).offset(16)
            make.trailing.equalTo(self).offset(16)
            make.height.equalTo(30).priority(.high)
        }
    }
}
