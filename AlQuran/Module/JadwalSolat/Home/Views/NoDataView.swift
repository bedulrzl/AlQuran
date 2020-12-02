//
//  NoDataView.swift
//  AlQuran
//
//  Created by Aprizal on 12/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

class NoDataView: UIView {

    var didTappedSetLocation:(() -> ())?

    @IBAction func actionSetLocation() {
        self.didTappedSetLocation?()
    }
}
