//
//  SolatViewController.swift
//  AlQuran
//
//  Created by Aprizal on 2/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class SolatViewController: UIViewController {
   
    var viewModelSolat: SolatViewModel!
    @IBOutlet weak var collectionView: UICollectionView!
    var kodeKota = String()
    var namaKota = String()
    
    //null kan
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelSolat = SolatViewModel(in: self)
        viewModelSolat.delegate = self
        print(kodeKota)
        title = "\(namaKota)"
        let nibCell = UINib(nibName: "SolatCollectionViewCell", bundle: nil)
        collectionView?.register(nibCell, forCellWithReuseIdentifier: "SolatCollectionViewCell")
        
        let headerNib = UINib.init(nibName: "HeaderSolatCollectionReusableView", bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSolatCell")
       
        // Do any additional setup after loading the view.
       

        collectionView.delegate = viewModelSolat
        collectionView.dataSource = viewModelSolat
        viewModelSolat.getJadwalSolat()
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.tabBarController?.tabBar.isHidden = true
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
//           navigationController?.tabBarController?.tabBar.isHidden = false
       }
    
    
    @IBAction func locationPressed(_ sender: Any) {
         viewModelSolat.setMyLocation(kodeKota: kodeKota)
         DispatchQueue.main.async {
             NotificationCenter.default.post(name: NSNotification.Name( "getjadwalsolat"), object: nil)
                //   self.navigationController?.pushViewController(hc, animated: true)
              self.navigationController?.popToRootViewController(animated: true)
         }
       
         
     }
    


}

extension SolatViewController: SolatViewDelegate {
    func displayTime() {
        self.collectionView.reloadData()
    }
    
    var kodeKotaView: String {
        return kodeKota
    }
}
