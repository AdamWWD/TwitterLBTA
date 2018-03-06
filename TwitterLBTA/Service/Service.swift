//
//  Service.swift
//  TwitterLBTA
//
//  Created by adamwang on 2018/3/6.
//  Copyright © 2018年 adamwang. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")

    static let sharedInstance = Service()

    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        print("Fetching home feed")
        let request:APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        request.perform(withSuccess: { homeDatasource in
            print("Successfully fetched our json objects")
            completion(homeDatasource)
            
//            self.datasource = homeDatasource
            
        }, failure: { err in
            print("Failed to fetch json...", err)
        })
        
        print(2)
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
