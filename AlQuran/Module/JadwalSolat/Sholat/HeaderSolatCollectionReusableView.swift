//
//  HeaderSolatCollectionReusableView.swift
//  AlQuran
//
//  Created by Aprizal on 5/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class HeaderSolatCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var namaKotaLabel: UILabel!
    @IBOutlet weak var tanggalLabel: UILabel!
    @IBOutlet weak var dateLabel: DateTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
}
