//
//  KotaTableViewCell.swift
//  AlQuran
//
//  Created by Aprizal on 1/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class KotaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var kotaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
