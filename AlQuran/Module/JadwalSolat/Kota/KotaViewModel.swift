//
//  KotaViewModel.swift
//  AlQuran
//
//  Created by Aprizal on 1/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol kotaViewDelegate: class {
    func displayKota()
    func displayNavigate(cell: UIViewController) 
}

class KotaViewModel: NSObject  {
       var arrKotas = [Kota]()
       weak var delegate: kotaViewDelegate?
    
        init(in kotaDelegate: kotaViewDelegate ) {
            self.delegate = kotaDelegate
        }
        
       let searchController = UISearchController(searchResultsController: nil)
       var filteredKota = [Kota]()
    
       var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
       }
    
      var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
      }
    
       func getAllKota(){
            APIClient().request(endpoint: APIRouter.kota) { (response) in
                      switch response {
                      case .success(let kota):
                        for js in kota["kota"].arrayValue {
                              let kotas = Kota(json: js)
                              self.arrKotas.append(kotas)
                             
               
                          }
                        DispatchQueue.main.async {
                            self.delegate?.displayKota()
                        }
                        
                        //ini kan udah bukan ya?
                        /*
                         - itu kan reload buat pas fetch dari api doang
                         pas luu bind sama search controller, data source nya berubah.
                         kalo lu mau otomatis tanpa bolak balik reload
                         lu mesti observe object data nya
                         bisa pake RX atau lu bikin observer sendri (tapi ribet kalo bikin sendiri)
                         Rx kaya apa? Rx kaya yang tadi pagi lu tonton
                         ah itu aja pusing gua liatinnya ha
                         rxswift itu ya
                         iya rx swift buat semua component objectnya
                         tapi kalo buat UI, lu pake rxcocoa
                         eh kebalik
                         jadi kalo install rx pasti sepaket rxswift sama rxcocoa
                         masih jauh ke situ kyanya ya gua haha
                         ya nanti aja belakangan itu mah
                         udah ah solat, ty coy trus go
                         pok
                         
                         */
                          case .failure(let error):
                              print(error)
                      }
                    
            }
       }
   
    
    func filterContentForSearchText(_ searchText: String	) {
        filteredKota = arrKotas.filter{ (kotas: Kota) -> Bool in
            return kotas.nama!.lowercased().contains(searchText.lowercased())
        }
        //benerin dulu errornya iutu udah
        ///RUN lah ga jalan haha
        //table nya ga berubah datanya :(
        	
        filteredKota.forEach({print($0.dictionaryRepresentation())})
    }
    
   
}

extension KotaViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isFiltering {
            return self.filteredKota.count
        }
        
        return self.arrKotas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KotaTableViewCell", for: indexPath) as? KotaTableViewCell
        let kotas: Kota
        if isFiltering {
            kotas = self.filteredKota[indexPath.row]
        } else {
            kotas = self.arrKotas[indexPath.row]
        }
        
        //salah ya
        
        cell?.kotaLabel.text = kotas.nama
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = SolatViewController(nibName: "SolatViewController", bundle: nil)
        let solats: Kota
        if self.isFiltering {
            solats = self.filteredKota[indexPath.row]
        } else {
            solats = self.arrKotas[indexPath.row]
        }
        cell.kodeKota = solats.id ?? ""
        cell.namaKota = solats.nama ?? ""
       
        delegate?.displayNavigate(cell: cell)
    
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    
}
