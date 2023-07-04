//
//  CatchPokemonRouter.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import Foundation
import UIKit

class CatchPokemonRouter: PTRCatchPokemonProtocol {
    static func createCatchPokemonModule() -> CatchPokemonVC {
        let view = CatchPokemonVC()
        let presenter = CatchPokemonPresenter()
        let interactor: PTICatchPokemonProtocol = CatchPokemonInteractor()
        let router : PTRCatchPokemonProtocol = CatchPokemonRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func navToAttackPokemon(img: String, nav: UINavigationController) {
        let vw = AttackPokemonRouter.createAttackPokemonModule()
        vw.img = img
        nav.pushViewController(vw, animated: true)
    }
    
    
}
