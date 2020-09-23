//
//  ApiError.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case couldNotDecode
    case failedRequest
    case unknowEroor (statuscode: Int)
}
