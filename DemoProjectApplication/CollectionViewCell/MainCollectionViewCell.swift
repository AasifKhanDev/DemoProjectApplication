//
//  MainCollectionViewCell.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 25/07/22.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet's
    @IBOutlet weak var mainCollectionImage: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func awakeFromNib() {
        mainCollectionImage.layer.cornerRadius = mainCollectionImage.frame.height/2
    }
}
