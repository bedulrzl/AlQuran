//
//  SolatViewModel.swift
//  AlQuran
//
//  Created by Aprizal on 2/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SolatViewDelegate: class {
    func displayTime()
    var kodeKotaView: String { get }
}

class SolatViewModel: NSObject {
    var arrSolat = [JSSolat]()
    weak var delegate: SolatViewDelegate?

    
    let datePicker = UIDatePicker()
    let defaults = UserDefaults.standard
  
    init(in solatDelegate: SolatViewDelegate ) {
        self.delegate = solatDelegate
    }

    
    func getJadwalSolat(str: String? = nil){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        var dateSelected = ""
        if str != nil {
            dateSelected = str!
        } else {
            dateSelected = formatter.string(from: Date())
        }
        APIClient().request(endpoint: APIRouter.jadwalSolat(kodekot: delegate?.kodeKotaView ?? "", tanggal: dateSelected)) { (response) in
            switch response {
            case .success(let json):
                let solats = JSSolat(json: json)
                self.arrSolat.removeAll()
                self.arrSolat.append(solats)
                print(solats)
                DispatchQueue.main.async {
                    self.delegate?.displayTime()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setMyLocation(kodeKota: String) {
        defaults.set(kodeKota, forKey: "kodekota")
    }
    
    
//    @objc func donePressed() {
//        fieldDone.text = "\()"
//    }
}

extension SolatViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if self.arrSolat.isEmpty {
            if !self.arrSolat.isEmpty {
                return 1
            }
            return 0
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrSolat.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SolatCollectionViewCell", for: indexPath) as? SolatCollectionViewCell
        let solat = self.arrSolat[indexPath.row]
        cell?.imsakLabel.text = solat.jadwal?.data?.imsak
        cell?.subuhLabel.text = solat.jadwal?.data?.subuh
        cell?.terbitLabel.text = solat.jadwal?.data?.terbit
        cell?.dhuhaLabel.text = solat.jadwal?.data?.dhuha
        cell?.dzuhurLabel.text = solat.jadwal?.data?.dzuhur
        cell?.asharLabel.text = solat.jadwal?.data?.ashar
        cell?.magribLabel.text = solat.jadwal?.data?.maghrib
        cell?.isyaLabel.text = solat.jadwal?.data?.isya
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //MARK: -header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSolatCell", for: indexPath) as? HeaderSolatCollectionReusableView
            if !self.arrSolat.isEmpty {
                let headerSolat = self.arrSolat[indexPath.row]
                header?.tanggalLabel.text = headerSolat.jadwal?.data?.tanggal
                header?.dateLabel.didSelectedDate = { date in
                    self.getJadwalSolat(str: date )
                }
            }
            return header!
        default:
            break
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: collectionView.frame.width, height: 150)
       }
    
}
