//
//  AttackPokemonPresenter.swift
//  PokemonApp
//
//  Created by Prizega  on 13/06/23.
//

import Foundation
import UIKit

class AttackPokemonPresenter: VTPAttackPokemonProtocol {
    var view: PTVAttackPokemonProtocol?
    
    var interactor: PTIAttackPokemonProtocol?
    
    var router: PTRAttackPokemonProtocol?
    
    
}

extension AttackPokemonPresenter: ITPAttackPokemonProtocol {
    func onSuccessGetDetail(data: [PokemonCatchModel]) {
        
    }
    
    
}
