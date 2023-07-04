//
//  AttackPokemonVC.swift
//  PokemonApp
//
//  Created by Prizega  on 13/06/23.
//

import UIKit
import Kingfisher
import WebKit
import SwiftyGif


class AttackPokemonVC: UIViewController {
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblPokemon: UILabel!
    @IBOutlet weak var imgSwipeUp: UIImageView!
    @IBOutlet weak var btnSwipeCatch: UIButton!
    
    var presenter: VTPAttackPokemonProtocol?
    var vwKey: String = ""
    var img: String = ""
    var pokeName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
//        DataCache.shared.cachedData(forKey: vwKey)
        
        let imgPoke = URL(string: img)
        imgPokemon.kf.setImage(with: imgPoke)
        lblPokemon.text = pokeName
        btnSwipeCatch.setTitle("", for: .normal)
        
        if let gifURL = Bundle.main.url(forResource: "swipeUp", withExtension: "gif") {
            let gifImageView = imgSwipeUp
            gifImageView?.setGifFromURL(gifURL)
        }
        
        btnSwipeCatch.setImage(UIImage(named: "PokemonLogoColored"), for: .normal)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            btnSwipeCatch.addGestureRecognizer(panGesture)
        
        
    }
    
    
    func swipeUpAction() {
        // Add your desired action here
        print("Button swiped up!")
        
        let successProb: UInt32 = 5
        let randomNumb = arc4random_uniform(10)
        
        if randomNumb < successProb {
            Alert.showGeneralAlert(title: "Success Catch Pokemon", message: "Do Other Action", viewController: self)
        } else {
            Alert.showGeneralAlert(title: "Failed Catch Pokemon", message: "Do Other Action", viewController: self)
        }
        
        imgSwipeUp.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.btnSwipeCatch.transform = .identity
        }
    }
    
    @objc func handleSwipe(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: view)
        let swipeUpThreshold: CGFloat = 100

        switch gestureRecognizer.state {
        case .began, .changed:
            // Move the button along with the user's finger
            btnSwipeCatch.transform = CGAffineTransform(translationX: 0, y: translation.y)
            imgSwipeUp.isHidden = true
        case .ended, .cancelled:
            // Check if the button is swiped up more than half of its height
            if btnSwipeCatch.frame.minY + btnSwipeCatch.frame.height / 2 < view.frame.height / 2 {
                // Implement the action for when the button is swiped up
                UIView.animate(withDuration: 0.3) {
                    self.btnSwipeCatch.transform = .identity
                }
                swipeUpAction()
            } else {
                // Reset the button's position
                UIView.animate(withDuration: 0.3) {
                    self.btnSwipeCatch.transform = .identity
                }
            }
        default:
            break
        }
    }



}

extension AttackPokemonVC: PTVAttackPokemonProtocol {
    
}
