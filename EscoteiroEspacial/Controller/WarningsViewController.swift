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
        
        print(astroId)
       // result = (100 * score)/5
       result()

    }
    
    func result() {
        if score <= 2 {
            label.text = "Você acertou \(score) de 5 das atividades, continue tentando 😁"
        }else if score == 5 {
            label.text = "Parabéns, Você acertou todas as atividades 🎉🎉🎉"
        }else {
            label.text = "Você acertou \(score) de 5 das atividades 🎉"
        }
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeSpaceController" {
            guard segue.destination is HomeSpaceController else { return }
        } else if segue.identifier == "InfoScreenController" {
            guard let destVC = segue.destination as? InfoScreenController else { return }
            destVC.astroIdentifier = segueStringToAstro(with: astroId)
        }
        
    }
    
    // swiftlint:disable:next cyclomatic_complexity
    func segueStringToAstro(with: String) -> Astro {
        switch with {
        case "sun":
            return .sunn
        case "mercury":
            return .mercury
        case "venus":
            return .venus
        case "moon":
            return .moon
        case "earth":
            return .earth
        case "mars":
            return .mars
        case "jupiter":
            return .jupiter
        case "saturn":
            return .saturn
        case "uran":
            return .uran
        case "neptun":
            return .neptun
        default:
            return .unknown
        }
    }
    
}
