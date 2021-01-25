//
//  CollectionViewCell.swift
//  Animation_Demo
//
//  Created by Mujahid on 25/01/21.
//  Copyright © 2021 Individual. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btn.layer.cornerRadius = btn.frame.width/2
    }

}
