//
//  TableViewCell.swift
//  apiimage
//
//  Created by MACBOOK AIR on 03/03/20.
//  Copyright © 2020 MACBOOK AIR. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
