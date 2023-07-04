//
//  ToolbarView.swift
//  PokemonApp
//
//  Created by Prizega  on 10/05/23.
//

import Foundation
import UIKit

protocol ToolbarViewDelegate{
    func pressBack()
    func pressUser()
}


@IBDesignable
class ToolbarView: UIView {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnUser: UIButton!
    
    var delegate: ToolbarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //MARK: - function ToolbarView
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "ToolbarView") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        
        btnBack.addTarget(self, action: #selector(btnBackTapped), for: .touchUpInside)
//        btnUser.addTarget(self, action: #selector(btnUserTapped), for: .touchUpInside)
        
    }
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setTitle(title: String) {
        lblTitle.text = title
    }
    
    func setImage(userImg: String){
        if userImg != ""{
            btnUser.setImage(UIImage(named:userImg), for: .normal)
        } else {
            btnUser.setImage(UIImage(named:"person.fill"), for: .normal)
        }
    }
    
    
    
    
    @objc private func btnBackTapped(){
        self.delegate?.pressBack()
    }
    
//    @objc private func btnUserTapped(){
//        self.delegate?.pressUser()
//    }

}
