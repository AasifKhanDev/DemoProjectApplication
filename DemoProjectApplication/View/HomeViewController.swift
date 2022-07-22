//
//  HomeViewController.swift
//  DemoProjectApplication
//
//  Created by DW-10 on 21/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var menuBar: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var collectionBgView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var thisWidth:CGFloat = 0
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionBgView.layer.cornerRadius = 14.0
        collectionBgView.layer.masksToBounds = true
        view.setGradientBackground()
    }
    
    // MARK: - ActionMethod
}
    // MARK: - Extension
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = topCollectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        cell.topLbl.text = "Boiler"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.section
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        thisWidth = CGFloat(self.view.frame.width)
//        return CGSize(width: thisWidth, height: self.view.frame.height)
//    }
}
