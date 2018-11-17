//
//  AboutPublicationViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
import SwiftyJSON

class AboutPublicationViewController: UIViewController {
    @IBOutlet weak var aTitlePublicationLabel: UILabel!
    @IBOutlet weak var aDescriptionPublicationLabel: UILabel!
    @IBOutlet weak var aPicturePublicationImage: UIImageView!
    
    var myAboutPublication: Publication?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let myPublication = myAboutPublication {
            aTitlePublicationLabel.text = myPublication.name
            aDescriptionPublicationLabel.text = myPublication.description
            if let urlPhoto = URL(string: myPublication.url) {
                aPicturePublicationImage.af_setImage(withURL: urlPhoto)
            }
        }
    }
    
    @IBAction func doneAboutPublication(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
