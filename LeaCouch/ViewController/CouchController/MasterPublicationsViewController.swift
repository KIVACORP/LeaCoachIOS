//
//  MasterPublicationsViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/20/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class MasterPublicationsViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var freePublicationsView: UIView!
    @IBOutlet weak var premiumPublicationsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }  

    @IBAction func ChangeSegmentedControlView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            freePublicationsView.alpha = 1
            premiumPublicationsView.alpha = 0
            
        } else {
            freePublicationsView.alpha = 0
            premiumPublicationsView.alpha = 1
        }
    }
    
}
