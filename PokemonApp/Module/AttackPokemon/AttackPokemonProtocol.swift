//
//  AttackPokemonProtocol.swift
//  PokemonApp
//
//  Created by Prizega  on 13/06/23.
//

import Foundation
import UIKit

protocol PTVAttackPokemonProtocol: AnyObject {
}

protocol VTPAttackPokemonProtocol: AnyObject {
    var view: PTVAttackPokemonProtocol? {get set}
    var interactor: PTIAttackPokemonProtocol? {get set}
    var router: PTRAttackPokemonProtocol? {get set}
}

protocol PTRAttackPokemonProtocol: AnyObject {
    static func createAttackPokemonModule() -> AttackPokemonVC
    
}

protocol PTIAttackPokemonProtocol: AnyObject {
    var presenter: ITPAttackPokemonProtocol? {get set}
}

protocol ITPAttackPokemonProtocol: AnyObject {
    func onSuccessGetDetail(data: [PokemonCatchModel])
    
}


