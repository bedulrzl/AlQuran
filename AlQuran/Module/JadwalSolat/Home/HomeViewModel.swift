//
//  HomeViewModel.swift
//  AlQuran
//
//  Created by Aprizal on 11/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol HomeViewDelegate: class {
    func displayTimes()
    func displayNothing()
}

class HomeViewModel: NSObject {
    var arrHome = [JSSolat]()
    var homedefaults = UserDefaults.standard
    weak var delegate: HomeViewDelegate?
    
    init(in homeDelegate: HomeViewDelegate) {
        self.delegate = homeDelegate
    }
    
    func getHomeSolat(){
        guard let kode = homedefaults.string(forKey: "kodekota") else {
            delegate?.displayNothing()
            return
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let str = formatter.string(from: Date())
        
        APIClient().request(endpoint: APIRouter.jadwalSolat(kodekot: kode, tanggal: str)) { (response) in
            switch response {
            case .success(let json):
                let homeSolat = JSSolat(json: json)
                self.arrHome.append(homeSolat)
                print(homeSolat)
                DispatchQueue.main.async {
                    if self.homedefaults.string(forKey: "kodekota") == nil {
                        self.delegate?.displayNothing()
                    } else {
                        self.delegate?.displayTimes()
                    }
                }
            case .failure(let error):
                self.delegate?.displayNothing()
                print(error.localizedDescription)
            }
        }
    }
}
extension HomeViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrHome.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell
        let homes = self.arrHome[indexPath.row]
        cell?.imsalLabel.text = homes.jadwal?.data?.imsak
        cell?.subuhLabel.text = homes.jadwal?.data?.subuh
        cell?.terbitLabel.text = homes.jadwal?.data?.terbit
        cell?.dhuhaLabel.text = homes.jadwal?.data?.dhuha
        cell?.dzuhurLabel.text = homes.jadwal?.data?.dzuhur
        cell?.asharLabel.text = homes.jadwal?.data?.ashar
        cell?.magribLabel.text = homes.jadwal?.data?.maghrib
        cell?.isyaLabel.text = homes.jadwal?.data?.isya
        return cell!
    }
    //DISCORD!
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
