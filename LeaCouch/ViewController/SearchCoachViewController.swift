//
//  SearchCoachViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class SearchCoachViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var coachTable: UITableView!
    @IBOutlet weak var coachSearchBar: UISearchBar!
    
    var coachesArray = [Coachesx]()
    var currentCoachArray = [Coachesx]()  // to search, update table search
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCoaches()
        
        setUpSearchBar()
    }
    
    private func setUpCoaches() {
        coachesArray.append(Coachesx(name: "Maria enriquez", correo: "kevinEnriquez@correo.com", speciality: .engineer, photo: "https://www.b-plast2000.com/uploads/pics/maria_01.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Roberto Marc", correo: "RobertoEnriquez@correo.com", speciality: .profesor, photo: "https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/82/square_thumb%402x.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Richard Juarex", correo: "RichardEnriquez@correo.com", speciality: .engineer, photo: "https://www.ktbyte.com/resources/dist/assets/images/people/richard_zhou.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Veronica Loo", correo: "VeronicaEnriquez@correo.com", speciality: .doctor, photo: "https://ct.yimg.com/cy/4592/38222887850_6ad7b5_128sq.jpg", views: 125))
        
        currentCoachArray = coachesArray  // update table search
    }
    
    //Table, cuando agregamos UITableVieDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return coachesArray.count
        return currentCoachArray.count  //update table search
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoachTableViewCell else {
            return UITableViewCell()
        }
               
        // to update table search
        cell.nameCoachLabel.text = currentCoachArray[indexPath.row].name
        cell.correoCoachLabel.text = currentCoachArray[indexPath.row].correo
        cell.especialityCoachLabel.text = currentCoachArray[indexPath.row].speciality.rawValue
        //cell.coachImage.image = UIImage(named: currentCoachArray[indexPath.row].photo)
        cell.itemsCoachLabel.text = String(currentCoachArray[indexPath.row].views)
        if let url = URL(string: currentCoachArray[indexPath.row].photo) {
            cell.coachImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "imagen_leacoach"))
        }
        return cell
    }
    
    // when I add UITableViewdelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    //to searchBar, add UISearchBarDelegate y vamos a su efinicion y copiamos las dos funciones de searchBar
    private func setUpSearchBar() {
        coachSearchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {        
        // to reload if not search and lower-uper case
        guard !searchText.isEmpty else {
            currentCoachArray = coachesArray
            coachTable.reloadData()
            return
        }
        currentCoachArray = coachesArray.filter({ coach -> Bool in
            coach.name.lowercased().contains(searchText.lowercased())
            
        })
        coachTable.reloadData()
    }
    //search all
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    //cancel search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentCoachArray = coachesArray
        searchBar.text = ""
        coachTable.reloadData()
    }
    
}

class Coachesx {
    let name: String
    let correo: String
    let speciality: SpecialistType
    let photo: String
    let views: Int
    
    init(name: String,
         correo: String,
         speciality: SpecialistType,
         photo: String,
         views: Int) {
        self.name = name
        self.correo = correo
        self.speciality = speciality
        self.photo = photo
        self.views = views
    }
}

enum SpecialistType: String {
    case engineer = "engineer"
    case profesor = "profesor"
    case doctor = "doctor"
}
