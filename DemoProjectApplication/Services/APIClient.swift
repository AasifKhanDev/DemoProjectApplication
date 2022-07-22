//
//  APIClient.swift
//  NetworkLayerApiAp
//
//  Created by Amit Sharma on 01/12/21.
//

import Foundation
import Alamofire



class APIClient {

    //MARK: - SignUp Api
    func performRequest<T:Decodable>(route:APIRouter, model:T.Type, completion:@escaping (Result<T, AFError>)->Void) {
        AF.request(route)
            .responseDecodable { (response: DataResponse<T, AFError>) in
                completion(response.result)
            }
    }
}

