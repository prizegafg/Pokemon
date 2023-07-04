//
//  PokemonMenuPresenter.swift
//  PokemonApp
//
//  Created by Prizega  on 07/05/23.
//

import Foundation
import UIKit

class PokemonMenuPresenter: VTPMenuProtocol {
    var view: PTVMenuProtocol?
    var interactor: PTIMenuProtocol?
    var router: PTRMenuProtocol?
    
    func goToCatch(nav: UINavigationController){
        router?.navigateToCatch(nav: nav)
    }
    
    func goToList(nav: UINavigationController) {
        router?.navigateToList(nav: nav)
    }
    
    func goToBattle(nav: UINavigationController) {
        router?.navigateToBattle(nav: nav)
    }
    
    
    
}

extension PokemonMenuPresenter: ITPMenuProtocol {
    
}
