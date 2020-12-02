//
//  AyatViewController.swift
//  AlQuran
//
//  Created by Aprizal on 18/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class AyatViewController: UIViewController {
    
    @IBOutlet weak var viewTable: UITableView!
    var nomorSurat = String()
    var viewModelAyat: AyatViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelAyat = AyatViewModel(in: self)
        viewModelAyat.delegate = self
        viewModelAyat.getayat()
        // Do any additional setup after loading the view.
        viewTable.dataSource = viewModelAyat
        viewTable.delegate = viewModelAyat
        
        
        let nibCell = UINib(nibName: "AyatTableViewCell", bundle: nil)
                    viewTable.register(nibCell, forCellReuseIdentifier: "AyatTableViewCell")
       
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AyatViewController: AyatViewDelegate {
    func displayAyat() {
        DispatchQueue.main.async {
            self.viewModelAyat.isLoadMore = false
            self.viewTable.reloadData()
        }
    }
    var nomorSuratDelegate: String{
        return nomorSurat
    }
    

}
