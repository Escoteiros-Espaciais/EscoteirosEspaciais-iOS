//
//  WelcomeViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 21/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Olá viajante, hoje você está iniciando\nsua jornada pelo sistema solar!"
    }
  
    @IBAction func skipButton(_ sender: Any) {
    }
    
}