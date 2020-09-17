//
//  LoaderDescriptionJson.swift
//  EscoteiroEspacial
//
//  Created by Paulo Uchôa on 14/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

public class LoaderDescriptionJson {
    
   @Published var planetData = [Planets]()
    
    let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let mainDirectory = Bundle.main.resourceURL!
    
    init() {
        load()
    }
    
    func load() {
        do {
            let data = try Data(contentsOf: mainDirectory.appendingPathComponent("Descriptions.json"))
            let decoder = JSONDecoder()
            let dataFromJson = try decoder.decode([Planets].self, from: data)
            
            self.planetData = dataFromJson
            
        } catch {
            print(error)
        }
    }
}
