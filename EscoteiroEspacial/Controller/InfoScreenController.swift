//
//  InfoScreenController.swift
//  EscoteiroEspacial
//
//  Created by Mateus Nobre on 10/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import UIKit

class InfoScreenController: UIViewController {

    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var backButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButon.layer.borderColor = CGColor(srgbRed: 100, green: 100, blue: 50, alpha: 1)
//        infoView.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
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
