//
//  ApiManager.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//

import Foundation

protocol QuestionDelegate: AnyObject {
    func questionFetched(_ questions:[Planets])
}

class ApiManager {
    
    weak var delegate: QuestionDelegate?
    
    func getQuestions() {
        
        let questionFile = RepositoryQuestion(filename: "question")
        let arrayAllQuestions = questionFile.load()
        self.delegate?.questionFetched(arrayAllQuestions)
        
        //Get a data task from the URLSession object
        
        //Create URL object
        let urlString = URL(string: "https://quiz-space.herokuapp.com/quiz/")
        
        guard let getUrl = urlString else {
            print(ApiError.invalidUrl)
            return
        }
        //Get URLSession object
        let session = URLSession.shared
        let dataTask = session.dataTask(with: getUrl) { (data, response, error) in
            
            //check if there were any errors
            if error != nil {
                print(ApiError.couldNotDecode)
                return
            }
            
            guard let response = response as?  HTTPURLResponse else {return}
            guard let data = data else {return}
            
            //Parsing the data into question objects
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let response = try? decoder.decode([Planets].self, from: data) {
                DispatchQueue.main.async {
                    //  Call the "questionsFetched" method of the delegate
                    questionFile.save(response)
                    self.delegate?.questionFetched(response)
                }
            } else {
                print(ApiError.unknowEroor(statuscode: response.statusCode))
            }
        }
        //Kick off the task
        dataTask.resume()
    }
    
}
