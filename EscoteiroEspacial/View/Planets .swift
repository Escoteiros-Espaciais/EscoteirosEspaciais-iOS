//
//  Planets .swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 15/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct Planets: Codable {
    var name: String?
    var information: String?
    var level: Int?
    var quiz: [Question] = []
}
