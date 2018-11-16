//
//  CoachTableViewCell.swift
//  LeaCouch
//
//  Created by Alumnos on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class CoachTableViewCell: UITableViewCell {
    @IBOutlet weak var coachImage: UIImageView!
    @IBOutlet weak var nameCoachLabel: UILabel!
    @IBOutlet weak var correoCoachLabel: UILabel!
    @IBOutlet weak var especialityCoachLabel: UILabel!
    @IBOutlet weak var itemsCoachLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
