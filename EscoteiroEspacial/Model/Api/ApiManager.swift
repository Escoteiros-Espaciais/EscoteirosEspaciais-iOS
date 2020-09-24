//
//  ApiManager.swift
//  EscoteiroEspacial
//
//  Created by PATRICIA S SIQUEIRA on 22/09/20.
//  Copyright © 2020 Mateus Nobre. All rights reserved.
//
import Foundation

struct ApiManager: Codable {

func planetsApi(completion: @escaping (Result< [Planets], ApiError>) -> Void) {
     
    var getComponents = URLComponents()
    getComponents.scheme = "https"
    getComponents.host = "quiz-space.herokuapp.com"
    getComponents.path = "/quiz"
 
    guard let getUrl = getComponents.url else {
        completion(.failure(ApiError.invalidUrl))
        return
    }
    
    let session = URLSession(configuration: .default)
    
    let getDiologuesTask = session.dataTask(with: getUrl) { (data, response, error) in
        
        if error != nil {
            completion(.failure(ApiError.couldNotDecode))
        }
        
        guard let response = response as? HTTPURLResponse else {return}
        switch response.statusCode {
        case 200:
            if let data = data {
                if let planetsList = try? JSONDecoder().decode([Planets].self, from: data) {
                    completion(.success(planetsList))
                    UserDefaults.standard.set(true, forKey: "showPlanets")
                    //print(planetsList.description)
                } else {
                    completion(.failure(ApiError.couldNotDecode))
                }
            }
        default:
            completion(.failure(ApiError.failedRequest))
        }
  }
        getDiologuesTask.resume()
}
}
