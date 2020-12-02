//
//  AyatViewModel.swift
//  AlQuran
//
//  Created by Aprizal on 18/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import SwiftyJSON
import Pageable

protocol AyatViewDelegate: class {
    func displayAyat()
    var nomorSuratDelegate: String { get }
    
}

class AyatViewModel: NSObject {		
    var arrAyat = [AyatAr]()
    var arrAyatIdt = [AyatIdt]()
    var arrAyatId = [AyatId]()
    weak var delegate: AyatViewDelegate?
    var isLoadMore = false
    var currentIndex = 0
    
    init(in ayatDelegate: AyatViewDelegate) {
           self.delegate = ayatDelegate
       }
    
    func getayat(){
        self.currentIndex += 1
        let secondChar = 1
        var nomorK:String!
        if currentIndex <= 1 {
            nomorK = "\(currentIndex)-\(currentIndex * 10)"
        } else {
            nomorK = "\(currentIndex - 1)\(secondChar)-\(currentIndex * 10)"
        }
        APIClient().request(endpoint: APIRouter.ayat(suratkode: delegate?.nomorSuratDelegate ?? "", nomorKode: nomorK)) { (response) in
            switch response {
            case .success(let ayat):
                 let ayat = AyatModel(json: ayat)
                 guard let hasilArray = ayat.ayat?.data?.ar else { return }
                 guard let hasilArray2 = ayat.ayat?.data?.idt else { return }
                 guard let hasilArray3 = ayat.ayat?.data?.id else { return }
                 for js in hasilArray {
                    self.arrAyat.append(js)
                 }
                 for js in hasilArray2 {
                    self.arrAyatIdt.append(js)
                 }
                 for js in hasilArray3 {
                    self.arrAyatId.append(js)
                 }
                 DispatchQueue.main.async {
                    self.delegate?.displayAyat()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}

extension AyatViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAyat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AyatTableViewCell", for: indexPath) as? AyatTableViewCell
        let ayats = arrAyat[indexPath.row]
        let latins = arrAyatIdt[indexPath.row]
        let arti = arrAyatId[indexPath.row]
        cell?.nomorayatLabel.text = ayats.ayat
        cell?.suratteksLabel.text = ayats.teks
        cell?.latinLabel.attributedText = latins.teks?.htmlAttributed(family: nil, size: 14, color: UIColor.init(hex: 000000)
        )
        cell?.artiLabel.text = arti.teks
        return cell!
        
    }
    

}

extension AyatViewModel: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if !self.isLoadMore {
            if maxOffset - currentOffset <= 10.0 {
                print("dah di bawah coy")
                self.isLoadMore = true
                self.getayat()
            }
        }
    }
}
