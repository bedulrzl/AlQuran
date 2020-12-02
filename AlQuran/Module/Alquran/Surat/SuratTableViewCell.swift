//
//  SuratTableViewCell.swift
//  AlQuran
//
//  Created by Aprizal on 16/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class SuratTableViewCell: UITableViewCell {
    @IBOutlet weak var namaSuratLabel: UILabel!
    @IBOutlet weak var nomorLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var jumlahayatLabel: UILabel!
    @IBOutlet weak var arabSuratLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nomorLabel.textColor = UIColor.darkGreen
        namaSuratLabel.textColor = UIColor.primaryText
        typeLabel.textColor = UIColor.secondText
        jumlahayatLabel.textColor = UIColor.secondText
        arabSuratLabel.textColor = UIColor.darkGreen
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
