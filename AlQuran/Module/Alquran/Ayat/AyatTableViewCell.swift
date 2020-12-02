//
//  AyatTableViewCell.swift
//  AlQuran
//
//  Created by Aprizal on 20/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class AyatTableViewCell: UITableViewCell {

    @IBOutlet weak var nomorayatLabel: UILabel!
    @IBOutlet weak var latinLabel: UILabel!
    @IBOutlet weak var artiLabel: UILabel!
    @IBOutlet weak var suratteksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
