//
//  Constant.swift
//  NetworkLayerApiAp
//
//  Created by Amit Sharma on 01/12/21.
//

import Foundation
import Alamofire

struct Constant {
    struct ProductionServer {
        static let baseURL  = "https://reqres.in/api"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case xApiKey = "x-api-key"
    case userId = "userId"
    case authToken = "authToken"
}

enum ContentType: String {
    case json = "application/json"
    case xApiKey = "f193b6ef69134b17a01e8e333554b8d8"
    case authorization = "Basic dGVubmlzQXBwOjEyM0B0ZW5uaXNBcHBAMTIz"
    case mimeType = "image/jpg"
}
enum APiParameterKey: String {
    case classId = "classId"
    case startDate = "startDate"
    case endDate = "endDate"
}


enum RequestParams {
    case body(_:Parameters)
    case url(_:Parameters)
}

struct Constants {
    static var authenticatedUser = "authenticatedUser"
}

func performRequest<T:Decodable>(route:APIRouter, completion:@escaping (Result<T, AFError>)->Void) {
    AF.request(route)
        .responseDecodable { (response: DataResponse<T, AFError>) in
            completion(response.result)
        }
}

