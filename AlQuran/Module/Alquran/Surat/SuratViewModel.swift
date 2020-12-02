//
//  SuratViewModel.swift
//  AlQuran
//
//  Created by Aprizal on 16/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SuratViewDelegate: class {
    func displaySurat()
    func displayNavigate(cell: UIViewController)
}

class SuratViewModel: NSObject {
    var arrSurat = [AQHasil]()
    weak var delegate: SuratViewDelegate?
    
    init(in suratDelegate: SuratViewDelegate) {
        self.delegate = suratDelegate
    }
    
    func getSurat() {
        APIClient().request(endpoint: APIRouter.surat){ (response) in
            switch response {
            case .success(let surat):
                let sqsurat = AQSurat(json: surat)
                guard let hasilArray = sqsurat.hasil else { return }
                for js in hasilArray {
//                 let surats = AQHasil(json: js)
                self.arrSurat.append(js)
               }
               DispatchQueue.main.async {
                    self.delegate?.displaySurat()
               }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension SuratViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSurat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuratTableViewCell", for: indexPath) as? SuratTableViewCell
        let surat = self.arrSurat[indexPath.row]
        cell?.namaSuratLabel.text = surat.nama
        cell?.nomorLabel.text = surat.nomor
        cell?.typeLabel.text = surat.type
        cell?.jumlahayatLabel.text = "\(surat.ayat ?? "") ayat"
        cell?.arabSuratLabel.text = surat.asma
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = AyatViewController(nibName: "AyatViewController", bundle: nil)
//              let surat: Kota
//              if self.isFiltering {
//                  solats = self.filteredKota[indexPath.row]
//              } else {
//                  solats = self.arrKotas[indexPath.row]
//              }
                let surats = self.arrSurat[indexPath.row]
                cell.nomorSurat = surats.nomor ?? ""
                cell.hidesBottomBarWhenPushed = true
                delegate?.displayNavigate(cell: cell)
           
       
    }
    
    
    
}


