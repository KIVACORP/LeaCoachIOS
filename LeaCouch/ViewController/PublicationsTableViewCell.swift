//
//  PublicationsTableViewCell.swift
//  LeaCouch
//
//  Created by Alumnos on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class PublicationsTableViewCell: UITableViewCell {
    @IBOutlet weak var picturePublicationImage: UIImageView!
    @IBOutlet weak var titlePublicationLabel: UILabel!
    @IBOutlet weak var datePublicationLabel: UILabel!
    @IBOutlet weak var descriptionPublicationLabel: UILabel!
    @IBOutlet weak var viewsPublicationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
