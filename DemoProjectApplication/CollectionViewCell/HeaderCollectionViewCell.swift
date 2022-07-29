//
//  TopCollectionViewCell.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 21/07/22.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topLbl: UILabel!
    
    override func awakeFromNib() {
        topImageView.layer.cornerRadius = 10.0
    }
    
   
}
