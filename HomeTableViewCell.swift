//
//  HomeTableViewCell.swift
//  System-Task
//
//  Created by apple on 6/25/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var imgVieww: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
