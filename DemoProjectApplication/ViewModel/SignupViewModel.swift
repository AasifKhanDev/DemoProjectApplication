//
//  SignupViewModel.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 20/07/22.
//

import Foundation
import UIKit

protocol SignupViewModelDelegate: AnyObject {
    func didReceiveSignupResponse(_ result: BasicResponseModel?, _ error: String?)
}

class SignupViewModel {
    
    weak var delegate: SignupViewModelDelegate!
    
    func SignupApi(_ email: String, _ password: String) {
        let request = APIRouter.signUp(email: email, password: password)
        APIClient().performRequest(route: request, model: BasicResponseModel.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let basicResponse):
                print(basicResponse)
                self.delegate.didReceiveSignupResponse(basicResponse, nil)
            case .failure(let error):
                print(error)
                self.delegate.didReceiveSignupResponse(nil, error.localizedDescription)
            }
        }
    }
}
