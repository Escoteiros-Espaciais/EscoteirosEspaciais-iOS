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
        guard let identifier = segue.identifier else { return }
        destVC.astroIdentifier = segueStringToAstro(with: identifier)
    }
    
    func segueStringToAstro(with: String) -> Astro {
        switch with {
        case "PassSunInfo":
            return .sunn
        case "PassMercuryInfo":
            return .mercury
        case "PassVenusInfo":
            return .venus
        case "PassMoonInfo":
            return .moon
        case "PassEarthInfo":
            return .earth
        case "PassMarsInfo":
            return .mars
        case "PassJupiterInfo":
            return .jupiter
        case "PassSaturnInfo":
            return .saturn
        case "PassUranInfo":
            return .uran
        case "PassNeptunInfo":
            return .neptun
        default:
            return .sunn
        }
    }
}
