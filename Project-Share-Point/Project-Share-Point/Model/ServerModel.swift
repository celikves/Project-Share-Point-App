//
//  ServerModel.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 30.05.2022.
//

import Foundation


/*

class ServerAccess{
    func get(completionHandler: @escaping ([BreedElement]?) -> Void) -> URLSessionDataTask{
        
        let components = URLComponents(string: "https://api.thecatapi.com/v1/breeds")
        
        var request = URLRequest(url: (components?.url)!)
        request.httpMethod = "GET"
        request.setValue("x-api-key", forHTTPHeaderField: "ec260b4b-a939-4e2f-bbb7-cf7c1638ea3e")

        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig)

        let task = session.dataTask(with: request) {(data, response, error) in
            if let data = data{
                if let jsonResult = try? JSONDecoder().decode([BreedElement].self, from: data){
                    completionHandler(jsonResult)
                }else{
                    completionHandler(nil)
                }
            }
        }
        task.resume()
        return task
    }
    
   
}
 */
