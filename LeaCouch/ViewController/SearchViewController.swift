//
//  SearchViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/9/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import os

class SearchViewController: UIViewController {
    @IBOutlet weak var viewContainer: UITableView!
    var searchViews: [UITableView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchViews = [UITableView]()
        searchViews.append(searchTutorViewController().view as! UITableView)
        searchViews.append(searchPublicationViewController().view as! UITableView)
        
        for v in searchViews {
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubviewToFront(searchViews[0])
    }
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubviewToFront(searchViews[sender.selectedSegmentIndex])
        //os_log("%@", sender.selectedSegmentIndex)
        //print("hola")
    }
    
}
