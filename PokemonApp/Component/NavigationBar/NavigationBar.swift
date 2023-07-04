//
//  NavigationBar.swift
//  PokemonApp
//
//  Created by Prizega  on 01/06/23.
//

import Foundation
import UIKit

protocol NavigationBarDelegate {
    func pressBack()
    func pressUser()
}

@IBDesignable
class NavigationBar: UIView {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnUser: UIButton!
    
    var delegate: NavigationBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "NavigationBar") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        
        self.btnBack.addTarget(self, action: #selector(btnBackTap), for: .touchUpInside)
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setTitle (title: String){
        self.lblTitle.text = title
    }
    
    func setUser(image: String){
        
    }
    
    @objc private func btnBackTap(){
        self.delegate?.pressBack()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
