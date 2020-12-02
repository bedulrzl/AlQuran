//
//  HomeViewController.swift
//  AlQuran
//
//  Created by Aprizal on 11/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    var viewModelHome: HomeViewModel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var viewNoData: NoDataView = {
        let nib = UINib(nibName: "NoDataView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! NoDataView
        
        return view
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
       
        viewModelHome = HomeViewModel(in: self)
        viewModelHome.delegate = self
        viewNoData.didTappedSetLocation = {
            let vc =  KotasViewController()
//            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        self.tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
               collectionView?.register(nibCell, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifJadwal), name: Notification.Name("getjadwalsolat"), object: nil)
        
        collectionView.delegate = viewModelHome
        collectionView.dataSource = viewModelHome
        viewModelHome.getHomeSolat()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    
    @objc func notifJadwal(){
         viewModelHome.getHomeSolat()
    }

}



extension HomeViewController: HomeViewDelegate {
    func displayTimes() {
        
        self.collectionView.backgroundView = nil
        self.collectionView.reloadData()
    }
    
    func displayNothing() {
        self.collectionView.backgroundView = viewNoData
    }
}

