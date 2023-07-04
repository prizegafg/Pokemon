//
//  CatchPokemonEntity.swift
//  PokemonApp
//
//  Created by Prizega  on 19/05/23.
//

import Foundation
import SwiftyJSON

struct PokemonNameModel {
    var url: String?
    var name: String?
    
    init(){}
    
    init(_ json: JSON){
        name = json["name"].stringValue
        url = json["url"].stringValue
    }
}

struct PokemonCatchModel {
//    let cache = commonCache<String, String>()
    var url: String?
    var name: String?
    var saveName:String?
    var image: String?
    var stat: [PokemonStatModel] = []
    var ability: [PokemonAbilityModel] = []
    var type: [PokemonTypeModel] = []
    
    
    
    init(){}
    
    init(_ json: JSON){
        name = json["name"].stringValue
        saveName = json["savename"].stringValue
        url = json["url"].stringValue
        image = json["sprites"]["front_default"].stringValue
        
        for i in json["stats"].arrayValue{
            stat.append(PokemonStatModel(i))
        }
        
        for i in json["abilities"].arrayValue{
            ability.append(PokemonAbilityModel(i))
        }
        
        for i in json["types"].arrayValue{
            type.append(PokemonTypeModel(i))
        }
//        stat = PokemonStatModel(json["stat"])
//        ability = PokemonAbilityModel(json["ability"])
//        type = PokemonTypeModel(json["type"])
        
        
    }
    
}

struct PokemonStatModel{
    var name: String?
    var url: String?
    var baseStat: Int?
    var effort: Int?
    
    init(){}
    
    init(_ json: JSON){
        let data = json["stat"]
        name = data["name"].stringValue
        url = data["url"].stringValue
        baseStat = json["base_stat"].intValue
        effort = json["effort"].intValue
    }
}

struct PokemonAbilityModel{
    var name: String?
    var url: String?
    var slot: Int?
    
    init(){}
    
    init(_ json: JSON){
        let data = json["ability"]
        name = data["name"].stringValue
        url = data["url"].stringValue
        slot = json["slot"].intValue
    }
    
}

struct PokemonTypeModel{
    var name: String?
    var url: String?
    var slot: Int?
    
    init(){}
    
    init(_ json: JSON){
        let data = json["type"]
        name = data["name"].stringValue
        url = data["url"].stringValue
        slot = json["slot"].intValue
    }
    
}
