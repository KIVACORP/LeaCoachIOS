//
//  FreePublicationTableViewCell.swift
//  LeaCouch
//
//  Created by Alumnos on 11/20/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class FreePublicationTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var adateLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
