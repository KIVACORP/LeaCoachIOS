//
//  AboutTutorViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/19/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class AboutTutorViewController: UIViewController {
    @IBOutlet weak var aboutPictureImage: UIImageView!
    @IBOutlet weak var aboutNameTutorLabel: UILabel!
    @IBOutlet weak var aboutEmailTutorLabel: UILabel!
    @IBOutlet weak var aboutDescriptionTutorLabel: UILabel!
    @IBOutlet weak var numDocTutorLabel: UILabel!
    @IBOutlet weak var likeTutorLabel: UILabel!
    @IBOutlet weak var premiumDocImage: UIImageView!
    
    var myAboutTutor: ResultX?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let myTutors = myAboutTutor {
            aboutNameTutorLabel.text = myTutors.name
            aboutEmailTutorLabel.text = myTutors.link + "@gmail.com"
            aboutDescriptionTutorLabel.text = myTutors.primary_description
            numDocTutorLabel.text = String(myTutors.review_duration)
            likeTutorLabel.text = String(myTutors.review_rating)
            if let urlPhoto = URL(string: NewApiTutor.baseUrl1 + myTutors.photo) {
                aboutPictureImage.af_setImage(withURL: urlPhoto)
            }
            /*if let urlPremium = URL(string: NewApiTutor.baseUrl1 + myTutors.photo) {
                premiumDocImage.af_setImage(withURL: urlPremium, placeholderImage: UIImage(named: "doc-premium"))
            }*/
        }
    }
    

    @IBAction func doneAboutTutor(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true)
    }
}
