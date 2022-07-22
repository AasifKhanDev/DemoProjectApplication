//
//  LoginViewModel.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 20/07/22.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate: AnyObject {
    func didReceiveResponse(_ result: BasicResponseModel?, _ error: String?)
}

class LoginViewModel {

    weak var delegate: LoginViewModelDelegate!
    
    func loginApi(_ email: String, _ password: String) {
        let request = APIRouter.login(email: email, password: password)
        APIClient().performRequest(route: request, model: BasicResponseModel.self) { [weak self] result  in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let basicResponseModel):
                print(basicResponseModel.token)
                self.delegate?.didReceiveResponse(basicResponseModel, nil)
            case .failure(let error):
                self.delegate.didReceiveResponse(nil, error.localizedDescription)
            }
        }
    }
}
