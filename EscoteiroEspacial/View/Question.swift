//
//  QuizData.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 15/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

struct Question: Codable {
    var text: String?
    var rightAnswer: String?
    var answers: [String]?
    
    init() {
        text = ""
        rightAnswer = ""
        answers = []
    }
}
