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
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var mainViewBg: UIView!
    
    // MARK: - Properties
    var imagesArr: [HeaderImgModel] = [HeaderImgModel.init(headerImg: "boilerImage1", headerLbl:                                      "Boiler Murga"),
                                       HeaderImgModel.init(headerImg: "desiMurga2", headerLbl: "Desi Murga"),
                                       HeaderImgModel.init(headerImg: "kadaknathImage", headerLbl: "Kadaknath"),
                                       HeaderImgModel.init(headerImg: "standardBoilerImg", headerLbl: "StandardBoiler"),
                                       HeaderImgModel.init(headerImg: "layerImg1", headerLbl: "Layer(Minar)")
                                       
    ]
    var Array: [ImageModel] = [ImageModel.init(mainImg: "images-6", mainLbl: "boiler"),
                               ImageModel.init(mainImg: "images-5", mainLbl: "Desi Murga"),
                               ImageModel.init(mainImg: "images-4", mainLbl: "Murga"),
                               ImageModel.init(mainImg: "images-6", mainLbl: "boiler"),
                               ImageModel.init(mainImg: "images-5", mainLbl: "Desi Murga"),
                               ImageModel.init(mainImg: "images-4", mainLbl: "Murga"),
                               ImageModel.init(mainImg: "images-6", mainLbl: "boiler"),
                               ImageModel.init(mainImg: "images-5", mainLbl: "Desi Murga")
    ]
    var timer: Timer!
    var currentCellIndex = 0
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        mainViewBg.setViewStyle()
        navBarView.setGradientBackground()
        profileBtn.tintColor = .white
        headerCollectionView.layer.cornerRadius = 10.0
        headerCollectionView.layer.masksToBounds = true
        headerCollectionView.delegate = self
        mainCollectionView.delegate = self
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScrollImage), userInfo: nil, repeats: true)
    }
    
    @objc func autoScrollImage() {
        if currentCellIndex < imagesArr.count - 1  {
            currentCellIndex = currentCellIndex + 1
        } else {
            currentCellIndex = 0
        }
        self.pageControl.numberOfPages = imagesArr.count
        self.pageControl.currentPage = currentCellIndex
        headerCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    // MARK: - ActionMethod
    @IBAction func profileBtnAction(_ sender: UIButton) {
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSettingViewController") as! ProfileSettingViewController
        navigationController?.pushViewController(profileVC, animated: true)
    }
}
    // MARK: - Extension
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return imagesArr.count
        }
        return Array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            cell.topImageView.image = UIImage(named: imagesArr[indexPath.item].headerImg)
            cell.topLbl.text = imagesArr[indexPath.item].headerLbl
            return cell
        }
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.mainCollectionImage.image = UIImage.init(named: Array[indexPath.item].mainImg)
        cell.mainLbl.text = Array[indexPath.item].mainLbl
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainCollectionView {
            let selectedIndex = indexPath.item
            print("----", selectedIndex)
            let birdDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "BirdDetailViewController") as! BirdDetailViewController
            self.navigationController?.pushViewController(birdDetailVC, animated: true)
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == headerCollectionView {
            return CGSize(width: self.headerCollectionView.frame.width, height: 200)
        }
        return CGSize(width: self.mainCollectionView.frame.width/2 - 6, height: 200)
        }
    }
