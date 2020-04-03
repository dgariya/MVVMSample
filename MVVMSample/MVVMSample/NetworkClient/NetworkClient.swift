//
//  NetworkRequest.swift
//  MVVMSample
//
//  Created by Singh, Dev on 2020/02/03.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(String)
}

public class NetworkClient {
    
    func request<T:Codable>(endPoint:EndPoint, completionHandler: @escaping (Result<T>) -> Void) {
        
        guard let url = endPoint.url else {
            return completionHandler(.failure("URL Error"))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completionHandler(.failure(error.localizedDescription))
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(.success(responseData))
                
            } catch let jsonError {
                completionHandler(.failure(jsonError.localizedDescription))
                return
            }
        }.resume()
    }

}

