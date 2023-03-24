//
//  QuizViewModel.swift
//  MVVM Api Integration App
//
//  Created by Prakash Tripathi on 24/03/23.
//

import Foundation

enum apiError : Error{
    case urlError
    case dataError
    case responseError
    case decodingError
    case message(Error)
    
}

class QuizViewModel{
    
    let apiUrl = URL(string:"https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")
    
    func getAPIResponse(completion: @escaping (Result<QuizModel, apiError>)-> Void){
        
        guard let apiUrl = apiUrl else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) { data, response, error in
            guard let data, error == nil else{
                completion(.failure(.dataError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200...499 ~= response.statusCode else{
                completion(.failure(.responseError))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(QuizModel.self, from: data)
                completion(.success(apiResponse))
                
            } catch (let error) {
                completion(.failure(.message(error)))
                
            }
                    
            
            
        }.resume()
        
        
        
    }
    
}
