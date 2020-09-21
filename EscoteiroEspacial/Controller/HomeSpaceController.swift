//
//  ViewController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 03/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class HomeSpaceController: UIViewController {

    @IBOutlet weak var solButton: UIButton!
    @IBOutlet weak var mercurioButton: UIImageView!
    @IBOutlet weak var venusButton: UIButton!
    @IBOutlet weak var luaButton: UIButton!
    @IBOutlet weak var terraButton: UIButton!
    @IBOutlet weak var marteButton: UIButton!
    @IBOutlet weak var jupiterButton: UIButton!
    @IBOutlet weak var saturnoButton: UIButton!
    @IBOutlet weak var uranoButton: UIButton!
    @IBOutlet weak var netunoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? InfoScreenController else { return }
        destVC.astroIdentifier = .earth
    }
    
//    func segueStringToAstro(with: String): Astro {
//        switch with {
//        case "":
//            return .sun
//        case " 1":
//            return .earth
//        
//        default:
//            return .earth
//        }
//    }
}


enum Astro {
    case sunn
    case earth
}
