//
//  CatchPokemonInteractor.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Darwin


class CatchPokemonInteractor: PTICatchPokemonProtocol {
    var presenter: ITPCatchPokemonProtocol?
    var url: String?
    var detailPokemon : [PokemonCatchModel] = []
    
    var get: Int = 0
    var end: Int = 0
    
    func getPokemonData(url: String) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let value = response.data{
                    let json = JSON(value)
                    var dataList: [PokemonNameModel] = []
                    
                    
                    let temp = json["results"].arrayValue
                    self.url = json["next"].stringValue
                    self.get = temp.count
                    for i in 0..<temp.count{
                        let dataTemp = PokemonNameModel(temp[i])
                        dataList.append(dataTemp)
                        let urlPokemon = dataTemp.url
                        self.getPokemonDetail(url: urlPokemon!)
                    }
                    
                    
                    
                    
//                    self.presenter?.onSuccessGetDetail(data: self.detailPokemon)
                    
                   
                }
                    
            case .failure(let error):
                let afError = error.localizedDescription
                let errorString = afError as String?
                self.presenter?.onErrorGetDetail(error: errorString!)
                print(error)
                // Handle the error
            }
        }
    }
    
    
    func getPokemonDetail(url: String) {
        print("Success Interactor")
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let value = response.data{
                    let json = JSON(value)
                    let data: PokemonCatchModel = PokemonCatchModel(json)
                    self.detailPokemon.append(data)
                    print(self.detailPokemon)
                    self.end += 1
                    if self.get == self.end {
                        self.presenter?.onSuccessGetDetail(data: self.detailPokemon)
                    }
                }
                    
            case .failure(let error):
                print(error)
                let afError = error.localizedDescription
                let errorString = afError as String?
                self.presenter?.onErrorGetDetail(error: errorString!)
            }
        }
    }
    
    
    
    
}
