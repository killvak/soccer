//
//  TheFieldTableViewCell.swift
//  Elmla3eb
//
//  Created by Killvak on 16/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class TheFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var numberOfFields: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
