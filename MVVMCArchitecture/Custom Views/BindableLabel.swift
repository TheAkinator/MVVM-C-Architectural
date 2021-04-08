//
//  BindableLabel.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 08/04/21.
//

import RxCocoa
import RxSwift
import UIKit

final class BindableLabel: UILabel {
    let disposeBag = DisposeBag()

    var bindValue: PublishSubject<String>? {
        didSet {
            bindValue?
                .asObserver()
                .map { $0 }
                .bind(to: rx.text)
                .disposed(by: disposeBag)
        }
    }
}
