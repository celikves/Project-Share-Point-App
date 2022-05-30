//
//  APIManager.swift
//  Project-Share-Point
//
//  Created by vesile çelik on 30.05.2022.
//

import Foundation
import Alamofire

class APIManager {
    static let shareInstance = APIManager()

    func callingregisterAPI(register : RegisterModel) {
        let headers : HTTPHeaders = [.contentType("application/json")]
        
        AF.request(register_url, method: .post, parameters: register, encoder:JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result {
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!,options: .mutableContainers) as? [String:Any]
                    print(json)
                    if let json = json as? [String: Any], let code = json["code"] as? String {
                        print(code)
                    }
                    
                }catch {
                    print(error.localizedDescription)
                }
            case .failure(let err) :
                print(err.localizedDescription)
            }
            
        }
        
    }
}
