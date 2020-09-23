//
//  Planets .swift
//  EscoteiroEspacial
//
//  Created by PATRICIA SIQUEIRA on 15/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
import Foundation

struct ResponseApiQuestion: Codable {
    var items: [Question]?
    }

struct Question: Codable {
    var planet: String?
    var text: String?
    var rightAnswer: String?
    var answer: [String]?
}
