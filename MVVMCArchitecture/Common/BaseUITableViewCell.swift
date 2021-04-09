//
//  BaseUITableViewCell.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import UIKit

class BaseUITableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
