//
//  PokemonMenuProtocol.swift
//  PokemonApp
//
//  Created by Prizega  on 07/05/23.
//

import Foundation
import UIKit

protocol VTPMenuProtocol: AnyObject{
    var view: PTVMenuProtocol? {get set}
    var interactor: PTIMenuProtocol? {get set}
    var router: PTRMenuProtocol? {get set}
    
    func goToCatch(nav: UINavigationController)
    func goToList(nav: UINavigationController)
    func goToBattle(nav: UINavigationController)
}

protocol PTVMenuProtocol: AnyObject{
    
}

protocol PTRMenuProtocol: AnyObject{
    static func createMenuModule()-> PokemonMenuVC
    func navigateToCatch(nav: UINavigationController)
    func navigateToList(nav: UINavigationController)
    func navigateToBattle(nav: UINavigationController)
}

protocol PTIMenuProtocol: AnyObject{
    var presenter:ITPMenuProtocol? {get set}
}

protocol ITPMenuProtocol: AnyObject{
    
}
