//
//  ApiConfiguaration.swift
//  NetworkLayerApiAp
//
//  Created by Amit Sharma on 01/12/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParams? { get }
}
