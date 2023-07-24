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
        characterListView.delegate = self
        
        characterListView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - RMCharacterListView Delegate
extension RMCharacterVC: RMCharacterListViewDelegate {
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailVC(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never 
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
