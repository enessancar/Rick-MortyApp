//
//  RMCharacterVC.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import UIKit
import SnapKit

final class RMCharacterVC: UIViewController {
    
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubviews(characterListView)
        
        characterListView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
