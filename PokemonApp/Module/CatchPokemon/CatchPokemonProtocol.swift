//
//  CatchPokemonProtocol.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import Foundation
import UIKit

protocol PTVCatchPokemonProtocol: AnyObject {
    func successGetPokemon(data: [PokemonCatchModel])
    func failedGetPokemon(error: String)
}

protocol VTPCatchPokemonProtocol: AnyObject {
    var view: PTVCatchPokemonProtocol? {get set}
    var interactor: PTICatchPokemonProtocol? {get set}
    var router: PTRCatchPokemonProtocol? {get set}
    
    func fetchGetPokemon(url: String)
    func goToAttackPokemon(img: String, nav: UINavigationController)
}

protocol PTRCatchPokemonProtocol: AnyObject {
    static func createCatchPokemonModule() -> CatchPokemonVC
    func navToAttackPokemon(img: String ,nav: UINavigationController)
    
}

protocol PTICatchPokemonProtocol: AnyObject {
    var presenter: ITPCatchPokemonProtocol? {get set}
    func getPokemonData(url: String)
}

protocol ITPCatchPokemonProtocol: AnyObject {
    func onSuccessGetDetail(data: [PokemonCatchModel])
    func onErrorGetDetail(error: String)
    
}


