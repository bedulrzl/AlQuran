//
//  KotaViewController.swift
//  AlQuran
//
//  Created by Aprizal on 1/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class KotasViewController: UIViewController {

    @IBOutlet weak var viewTable: UITableView!
    var viewModelKota: KotaViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Pilih Kota"
        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: "KotaTableViewCell", bundle: nil)
        viewTable.register(nibCell, forCellReuseIdentifier: "KotaTableViewCell")
        
        viewModelKota = KotaViewModel(in: self)
        viewModelKota.delegate = self
        
        viewTable.delegate = viewModelKota
        viewTable.dataSource = viewModelKota
        viewModelKota.getAllKota()
        viewModelKota.searchController.searchResultsUpdater = self
        viewModelKota.searchController.obscuresBackgroundDuringPresentation = false
        viewModelKota.searchController.searchBar.placeholder = "Search City"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = viewModelKota.searchController
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}



extension KotasViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModelKota.filterContentForSearchText(searchBar.text!)
        DispatchQueue.main.async {
            self.viewTable.reloadData()
        }
    }
    
}

extension KotasViewController: kotaViewDelegate{
    func displayKota() {
        self.viewTable.reloadData()
    }
    func displayNavigate(cell: UIViewController) {
         self.navigationController?.pushViewController(cell, animated: true)
    }
}
