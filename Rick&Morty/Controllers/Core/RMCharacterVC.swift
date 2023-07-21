//
//  RMCharacterVC.swift
//  Rick&Morty
//
//  Created by Enes Sancar on 21.07.2023.
//

import UIKit

final class RMCharacterVC: UIViewController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        let request = RMRequest(endpoint: .character,
        queryParameters: [
            URLQueryItem(name: "name", value: "rick")
        ])
    }
}
