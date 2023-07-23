//
//  CharacterListViewViewModel.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 22.07.2023.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacter()
}

final class RMCharacterListViewViewModel: NSObject {
    
    weak var delegate: RMCharacterListViewViewModelDelegate?
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    public func fetchCharacters() {
        RMService.shared.execute(.listCharacterRequest, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self.characters = results
                DispatchQueue.main.async {
                    self.delegate?.didLoadInitialCharacter()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension RMCharacterListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        let viewModel = cellViewModels[indexPath.item]
        cell.configure(with: viewModel)
        return cell
    }
}

//MARK: - UICOllectionView Delegate/Flowlayout
extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
