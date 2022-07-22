//
//  APIRouter.swift
//  NetworkLayerApiAp
//
//  Created by Amit Sharma on 01/12/21.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    case signUp(email: String, password: String)
    case login(email: String, password: String)
    case forgotPassword(email: String)

    //MARK: - Method
    var method: HTTPMethod {
            switch self {
            case .signUp, .login:
                return .post
            case .forgotPassword:
                return .get
            }
    }

    //MARK: - Parameters
    var parameters: RequestParams? {
        switch self {
        case .signUp(let email, let password):
            return .body(["email": email, "password": password])
        case .login(let email, let password):
            return .body(["email": email, "password": password])
        case .forgotPassword(let email):
            return .body(["email":email])
        }
    }

    //MARK: - Path
    var path: String {
        switch self {
        case .signUp:
            return "/register"
        case .login:
            return "/login"
        case .forgotPassword:
            return ""
        }
    }

    //MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.ProductionServer.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        urlRequest.httpMethod = method.rawValue

        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.xApiKey.rawValue, forHTTPHeaderField: HTTPHeaderField.xApiKey.rawValue)
        urlRequest.setValue(ContentType.authorization.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)

//        if let loggedInUser = AuthenticatedUser.authenticatedUser {
//            urlRequest.setValue(loggedInUser.studentId, forHTTPHeaderField: HTTPHeaderField.userId.rawValue)
//            urlRequest.setValue(loggedInUser.authToken, forHTTPHeaderField: HTTPHeaderField.authToken.rawValue )
//        }

        switch parameters {
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])

        case .url(let params):
            let queryParams = params.map { pair  in
                return URLQueryItem(name: pair.key, value: "\(pair.value)")
            }
            var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
            components?.queryItems = queryParams
            urlRequest.url = components?.url
        case .none:
            break
        }
        debugPrint("URL REQUEST", urlRequest)
        return urlRequest
    }
}

