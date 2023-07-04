//
//  CatchPokemonTVC.swift
//  PokemonApp
//
//  Created by Prizega  on 08/06/23.
//

import UIKit

class CatchPokemonTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgStat1: UIImageView!
    @IBOutlet weak var imgStat2: UIImageView!
    @IBOutlet weak var imgStat3: UIImageView!
    @IBOutlet weak var imgStat4: UIImageView!
    @IBOutlet weak var imgStat5: UIImageView!
    @IBOutlet weak var imgStat6: UIImageView!
    @IBOutlet weak var imgStat7: UIImageView!
    @IBOutlet weak var imgStat8: UIImageView!
    @IBOutlet weak var imgStat9: UIImageView!
    @IBOutlet weak var imgStat10: UIImageView!
    
    
    static let identifier = "CatchPokemonTVC"
    
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(title: String, stats: Int){
        lblTitle.text = title
        switch stats {
        case 1...10 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightDark")
            imgStat3.image = UIImage(named: "RightDark")
            imgStat4.image = UIImage(named: "RightDark")
            imgStat5.image = UIImage(named: "RightDark")
            imgStat6.image = UIImage(named: "RightDark")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 11...20 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightDark")
            imgStat4.image = UIImage(named: "RightDark")
            imgStat5.image = UIImage(named: "RightDark")
            imgStat6.image = UIImage(named: "RightDark")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 21...30 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightDark")
            imgStat5.image = UIImage(named: "RightDark")
            imgStat6.image = UIImage(named: "RightDark")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 31...40 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightDark")
            imgStat6.image = UIImage(named: "RightDark")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 41...50 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightDark")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 51...60 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightDark")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 61...70 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightFire")
            imgStat8.image = UIImage(named: "RightDark")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 71...80 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightFire")
            imgStat8.image = UIImage(named: "RightFire")
            imgStat9.image = UIImage(named: "RightDark")
            imgStat10.image = UIImage(named: "RightDark")
        case 81...90 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightFire")
            imgStat8.image = UIImage(named: "RightFire")
            imgStat9.image = UIImage(named: "RightFire")
            imgStat10.image = UIImage(named: "RightDark")
        case 91...100 :
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightFire")
            imgStat8.image = UIImage(named: "RightFire")
            imgStat9.image = UIImage(named: "RightFire")
            imgStat10.image = UIImage(named: "RightFire")
            
        default:
            imgStat1.image = UIImage(named: "RightFire")
            imgStat2.image = UIImage(named: "RightFire")
            imgStat3.image = UIImage(named: "RightFire")
            imgStat4.image = UIImage(named: "RightFire")
            imgStat5.image = UIImage(named: "RightFire")
            imgStat6.image = UIImage(named: "RightFire")
            imgStat7.image = UIImage(named: "RightFire")
            imgStat8.image = UIImage(named: "RightFire")
            imgStat9.image = UIImage(named: "RightFire")
            imgStat10.image = UIImage(named: "RightFire")
        }
    }
    
}
