//
//  MasterSearchViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/15/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class MasterSearchViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var coachesView: UIView!
    @IBOutlet weak var publicationsView: UIView!
    //to search
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var coachTable: UITableView!
    
    var coachesArray = [Coachesx]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCoaches()
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
    
    // to search
    private func setUpCoaches() {
        coachesArray.append(Coachesx(name: "Maria enriquez", correo: "kevinEnriquez@correo.com", speciality: .engineer, photo: "https://www.b-plast2000.com/uploads/pics/maria_01.jpg"))
        coachesArray.append(Coachesx(name: "Roberto Marc", correo: "RobertoEnriquez@correo.com", speciality: .noEngineer, photo: "https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/82/square_thumb%402x.jpg"))
        coachesArray.append(Coachesx(name: "Richard Juarex", correo: "RichardEnriquez@correo.com", speciality: .engineer, photo: "https://www.ktbyte.com/resources/dist/assets/images/people/richard_zhou.jpg"))
        coachesArray.append(Coachesx(name: "Veronica Loo", correo: "VeronicaEnriquez@correo.com", speciality: .noEngineer, photo: "https://ct.yimg.com/cy/4592/38222887850_6ad7b5_128sq.jpg"))
    }
    
    //tables
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coachesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoachTableViewController else {
            return UITableViewCell()
        }*/
        return UITableViewCell()
    }
    
}

class Coachesx {
    let name: String
    let correo: String
    let speciality: SpecialistType
    let photo: String
    
    init(name: String,
        correo: String,
        speciality: SpecialistType,
        photo: String) {
        self.name = name
        self.correo = correo
        self.speciality = speciality
        self.photo = photo
    }
}

enum SpecialistType: String {
    case engineer = "engineer"
    case noEngineer = "noEngineer"
}
//https://www.b-plast2000.com/uploads/pics/maria_01.jpg
//https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/82/square_thumb%402x.jpg
//https://www.ktbyte.com/resources/dist/assets/images/people/richard_zhou.jpg
//https://ct.yimg.com/cy/4592/38222887850_6ad7b5_128sq.jpg
