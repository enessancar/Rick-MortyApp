//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 22.07.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    //MARK: - Init
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.rawValue)"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, CustomError>) -> ()) {
        guard let url = characterImageUrl else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
