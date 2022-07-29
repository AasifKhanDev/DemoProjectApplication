//
//  BirdDetailViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 27/07/22.
//

import UIKit
import Alamofire

class BirdDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var birdTitle: UILabel!
    @IBOutlet weak var availability: UILabel!
    @IBOutlet weak var netQuantity: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var nameErrorLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorView: UIView!
    @IBOutlet weak var phoneErrorLbl: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneErrorView: UIView!
    @IBOutlet weak var quantityErrorLbl: UILabel!
    @IBOutlet weak var quintalTextField: UITextField!
    @IBOutlet weak var kgTextField: UITextField!
    @IBOutlet weak var quintalDropBtn: UIButton!
    @IBOutlet weak var kgDropBtn: UIButton!
    @IBOutlet weak var quantityErrorView: UIView!
    @IBOutlet weak var amountErrorLbl: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountErrorView: UIView!
    @IBOutlet weak var farmAddressErrorLbl: UILabel!
    @IBOutlet weak var farmAddressTextField: UITextField!
    @IBOutlet weak var farmAddressErrorView: UIView!
    @IBOutlet weak var yourAddressErrorLbl: UILabel!
    @IBOutlet weak var yourAddressTextField: UITextField!
    @IBOutlet weak var yourAddressErrorView: UIView!
    @IBOutlet weak var deliveryChargelbl:UILabel!
    @IBOutlet weak var farmAddressStackView: UIStackView!
    @IBOutlet weak var yourAddressStackView: UIStackView!
    @IBOutlet weak var pickupBtn: UIButton!
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var placeOrderBtn: UIButton!
    
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarView.setGradientBackground()
        headerView.setViewStyle()
        view.setGradientBackground()
        detailView.layer.masksToBounds = true
        headerView.layer.masksToBounds = true
        placeOrderBtn.setGradientBackground()
        placeOrderBtn.layer.cornerRadius = 8
        placeOrderBtn.layer.masksToBounds = true
        detailView.layer.cornerRadius = 14.0
        birdImage.layer.cornerRadius = birdImage.frame.height/2
        farmAddressStackView.isHidden = true
        yourAddressStackView.isHidden = true
        detailView.backgroundColor = .orange
        
    }
    
    // MARK: - Action Methods
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func pickupBtnClicked(_ sender: Any) {
        farmAddressStackView.isHidden = false
        yourAddressStackView.isHidden = true
    }
    @IBAction func deliveryBtnClicked(_ sender: UIButton) {
        farmAddressStackView.isHidden = true
        yourAddressStackView.isHidden = false
    }
}
