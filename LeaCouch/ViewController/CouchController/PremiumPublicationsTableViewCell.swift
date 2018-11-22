//
//  PremiumPublicationsTableViewCell.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/22/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class PremiumPublicationsTableViewCell: UITableViewCell {
    @IBOutlet weak var premiumPictureImage: UIImageView!
    @IBOutlet weak var premiumTitleLabel: UILabel!
    @IBOutlet weak var premiumDateLabel: UILabel!
    @IBOutlet weak var premiumDescrptionLabel: UILabel!
    @IBOutlet weak var premiumViewsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
