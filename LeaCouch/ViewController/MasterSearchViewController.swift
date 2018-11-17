//
//  MasterSearchViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/15/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class MasterSearchViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var coachesView: UIView!
    @IBOutlet weak var publicationsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // tochange
    @IBAction func changeSegmentedControlViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            coachesView.alpha = 1
            publicationsView.alpha = 0
            
        } else {
            coachesView.alpha = 0
            publicationsView.alpha = 1
        }
    }
}
