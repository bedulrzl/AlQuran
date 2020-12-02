//
//  SuratViewController.swift
//  AlQuran
//
//  Created by Aprizal on 16/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class SuratViewController: UIViewController {
    
    @IBOutlet weak var viewTable: UITableView!
    var viewModelSurat: SuratViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Al-Quran"
        viewModelSurat = SuratViewModel(in: self)
        viewModelSurat.delegate = self
        
        viewTable.delegate = viewModelSurat
        viewTable.dataSource = viewModelSurat
        
          let nibCell = UINib(nibName: "SuratTableViewCell", bundle: nil)
              viewTable.register(nibCell, forCellReuseIdentifier: "SuratTableViewCell")
        viewModelSurat.getSurat()
        // Do any additional setup after loading the view.
        
        
    }
}


extension SuratViewController: SuratViewDelegate {
    func displaySurat() {
        self.viewTable.reloadData()
    }
    func displayNavigate(cell: UIViewController) {
       
        self.navigationController?.pushViewController(cell, animated: true)
    }
    
    
}
