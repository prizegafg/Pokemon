//
//  PokemonMenuVC.swift
//  PokemonApp
//
//  Created by Prizega  on 07/05/23.
//

import UIKit

class PokemonMenuVC: UIViewController {
    @IBOutlet weak var flowBackground: FlowingBackgroundView!
    @IBOutlet weak var tintedView: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnCatch: UIButton!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var btnBattle: UIButton!
    
    var presenter: VTPMenuProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        setUpAction()
    }
    
    func setUpView(){
        tintedView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//        tintedView.backgroundColor = UIColor.clear
        imgLogo.image = UIImage(named: "PokemonLogoColored")
        lblTitle.text = "PokemonApps"
        lblTitle.textColor = .white
        
        btnCatch.setTitle("Catch Pokemon", for: .normal)
        btnCatch.setTitleColor(.black, for: .normal)
        btnCatch.backgroundColor = .orangeCustom
        btnCatch.layer.cornerRadius = 10
        
        btnList.setTitle("My Pokemon", for: .normal)
        btnList.setTitleColor(.black, for: .normal)
        btnList.backgroundColor = .greenCustom
        btnList.layer.cornerRadius = 10
        
        btnBattle.setTitle("Battle Pokemon", for: .normal)
        btnBattle.setTitleColor(.black, for: .normal)
        btnBattle.backgroundColor = .blueCustom
        btnBattle.layer.cornerRadius = 10
        
        
        
    }
    
    func setUpAction(){
        btnCatch.addTarget(self, action: #selector(onClickCatch), for: .touchUpInside)
        btnList.addTarget(self, action: #selector(onClickList), for: .touchUpInside)
        btnBattle.addTarget(self, action: #selector(onClickFight), for: .touchUpInside)
        
    }
    
    @objc func onClickCatch(){
        if let navigation = self.navigationController{
            self.presenter?.goToCatch(nav: navigation)
        }
    }
    
    @objc func onClickList(){
        let navigation = navigationController!
        presenter?.goToList(nav: navigation)
    }
    
    @objc func onClickFight(){
        let navigation = navigationController!
        presenter?.goToBattle(nav: navigation)
    }

}

extension PokemonMenuVC: PTVMenuProtocol{
    
}
