//
//  BaseOfQuestions.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

class RepositoryQuestion {
    
    var fileURL: URL
    
    init(filename: String = "file_manager") {
        let getUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var fileURL = getUrl.appendingPathComponent(filename)
        fileURL = fileURL.appendingPathExtension("json")
        print(fileURL)
        self.fileURL = fileURL
    }
        
        func save(_ questions: [Planets]) {
            do {
                let jsonData = try JSONEncoder().encode(questions)
                try jsonData.write(to: fileURL)
            } catch {
                print("It was not possible to save the questions.")
            }
        }
        
     func load() -> [Planets] {
            var questions: [Planets] = []
            do {
                let jsonData = try Data(contentsOf: fileURL)
                questions = try JSONDecoder().decode([Planets].self, from: jsonData)
                return questions
            } catch {
                print("It was not possible to load the questions.")
                return questions
            }
        }
    
}
