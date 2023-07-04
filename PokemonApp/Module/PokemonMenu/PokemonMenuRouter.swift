//
//  PokemonMenuRouter.swift
//  PokemonApp
//
//  Created by Prizega  on 07/05/23.
//

import Foundation
import UIKit

class PokemonMenuRouter: PTRMenuProtocol {
    static func createMenuModule() -> PokemonMenuVC {
        let view = PokemonMenuVC()
        let presenter = PokemonMenuPresenter()
        let interactor: PTIMenuProtocol = PokemonMenuInteractor()
        let router : PTRMenuProtocol = PokemonMenuRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        view.presenter = presenter
        
        return view
    }
    
    func navigateToCatch(nav: UINavigationController){
        let view = CatchPokemonRouter.createCatchPokemonModule()
        nav.pushViewController(view, animated: true)
    }
    
    func navigateToList(nav: UINavigationController){
        
    }
    
    func navigateToBattle(nav: UINavigationController){
        
    }
    
    
}
