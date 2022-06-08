//
//  APIManager.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 30.05.2022.
//

import Foundation
import Alamofire

enum APIErrors : Error {
    case custom(message:String)
}

typealias Handler  = (Swift.Result<Any?, APIErrors>) -> Void

class APIManager {
    static let shareInstance = APIManager()

    func callingregisterAPI(register : RegisterModel, competionHandler:@escaping (Bool,String) ->()) {
        let headers : HTTPHeaders = [.contentType("application/json")]
        
        AF.request(register_url, method: .post, parameters: register, encoder:JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            
            //print("bu bir responsedurrrrrrrr\(response.response!.statusCode)") /// status codunu döndürüyor Yeeees!!
          
            switch response.result {
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as? [String:Any]
                    
                    if response.response?.statusCode == 200 {
                        competionHandler(true,"User created succesfully!")
                    }else{
                        competionHandler(false,"Please try again!")
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    competionHandler(false,"Please try again!")
                }
            case .failure(let err) :
                print(err.localizedDescription)
                competionHandler(false,"Please try again!")
            }
            
        }
        
    }
    
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!/CALLING LOGIN API
    
    func callingloginAPI(login : LoginModel, competionHandler: @escaping Handler) {
        let headers : HTTPHeaders = [.contentType("application/json")]
        
        AF.request(login_url, method: .post, parameters:login, encoder:JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            
            //print("bu bir responsedurrrrrrrr\(response.response!.statusCode)") /// status codunu döndürüyor Yeeees!!
          
            switch response.result {
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as? [String:Any]
                    
                    if response.response?.statusCode == 200 {
                        competionHandler(.success(json))
                    }else{
                        competionHandler(.failure(.custom(message: "Please check your connection.")))
                    }
                    
                }catch {
                    print(error.localizedDescription)
                    competionHandler(.failure(.custom(message: "Please try again")))
                }
            case .failure(let err) :
                print(err.localizedDescription)
                competionHandler(.failure(.custom(message: "Please try again")))
            
        }
        
    }
    
    
}
}
