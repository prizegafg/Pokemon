//
//  AttackPokemonRouter.swift
//  PokemonApp
//
//  Created by Prizega  on 13/06/23.
//

import Foundation
import UIKit

class AttackPokemonRouter: PTRAttackPokemonProtocol {
    static func createAttackPokemonModule() -> AttackPokemonVC {
        let view = AttackPokemonVC()
        let presenter = AttackPokemonPresenter()
        let interactor: PTIAttackPokemonProtocol = AttackPokemonInteractor()
        let router : PTRAttackPokemonProtocol = AttackPokemonRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    
}
