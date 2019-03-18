//
//  ViewController.swift
//  TapCounter
//
//  Created by Buse ERKUŞ on 17.03.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let numLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    let tapperButton: UIButton = {
        let tb = UIButton()
        tb.setTitle("ARTTIR", for: UIControl.State.normal)
        tb.backgroundColor = .red
        tb.layer.cornerRadius = 10
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    let resButton: UIButton = {
        let res = UIButton()
        res.translatesAutoresizingMaskIntoConstraints = false
        res.setTitle("RESET", for: UIControl.State.normal)
        res.layer.cornerRadius = 10
        res.backgroundColor = .red
        return res
    }()
    
    fileprivate let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapperButton.rx.tap.subscribe({ [weak self] _ in
            guard let this = self else {
                return
            }
            guard let text = this.numLabel.text else {
                return
            }
            guard let number = Int(text) else {
                return
            }
            this.numLabel.text = String(number+1)
        }).disposed(by: disposeBag)
        
        resButton.rx.tap.subscribe({ [weak self] _ in
            guard let this = self else {
                return
            }
            this.numLabel.text = "0"
        }).disposed(by: disposeBag)
        
        self.view.addSubview(numLabel)
        self.view.addSubview(tapperButton)
        self.view.addSubview(resButton)
        
        numLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        numLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 200).isActive = true
        numLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        
        tapperButton.topAnchor.constraint(equalTo: numLabel.bottomAnchor, constant: -250).isActive = true
        tapperButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
        tapperButton.rightAnchor.constraint(equalTo: numLabel.rightAnchor, constant: -50).isActive = true
        tapperButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        resButton.topAnchor.constraint(equalTo: tapperButton.bottomAnchor, constant: 50).isActive = true
        resButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
        resButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -150).isActive = true

    }
    
    
    
    
    
}

