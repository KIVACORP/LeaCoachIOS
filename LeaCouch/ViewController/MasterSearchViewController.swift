//
//  MasterSearchViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/15/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class MasterSearchViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var coachesView: UIView!
    @IBOutlet weak var publicationsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupView()
    }
    
    
    @IBAction func changeSegmentedControlViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            coachesView.alpha = 1
            publicationsView.alpha = 0
        } else {
            coachesView.alpha = 0
            publicationsView.alpha = 1
        }
    }
    
    
    //view methods
    /*private func setupView() {
        setupSegmentedContro()
    }
    
    private func updateView() {
        
    }
    
    //
    private func setupSegmentedContro() {
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Coaches", at: 1, animated: false)
        segmentedControl.insertSegment(withTitle: "Publications", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    //Actions
    @objc func selectionDidChange(sender: UISegmentedControl) {
        updateView()
    }*/
    
}
