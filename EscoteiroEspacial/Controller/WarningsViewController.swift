//
//  WarningsViewController.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 21/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class WarningsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonSolarSystem: UIButton!
    @IBOutlet weak var remakeTest: UIButton!
    
    var astroId = ""
    var score = 0
   // var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // result = (100 * score)/5
        label.text = "Você acertou \(score)/5 das atividades 🎉"

    }

}
