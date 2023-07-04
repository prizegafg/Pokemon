//
//  CatchPokemonPresenter.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import Foundation
import UIKit

class CatchPokemonPresenter: VTPCatchPokemonProtocol {
    var view: PTVCatchPokemonProtocol?
    var interactor: PTICatchPokemonProtocol?
    var router: PTRCatchPokemonProtocol? 

    func fetchGetPokemon(url: String) {
        interactor?.getPokemonData(url: url)
    }
    
    func goToAttackPokemon(img: String, nav: UINavigationController) {
        router?.navToAttackPokemon(img: img,nav: nav)
    }
    
    
    
    
}

extension CatchPokemonPresenter : ITPCatchPokemonProtocol {
    func onSuccessGetDetail(data: [PokemonCatchModel]) {
        view?.successGetPokemon(data: data)
        
    }
    
    func onErrorGetDetail(error: String) {
        view?.failedGetPokemon(error: error)
    }
    
    
    
    
    
    
}
