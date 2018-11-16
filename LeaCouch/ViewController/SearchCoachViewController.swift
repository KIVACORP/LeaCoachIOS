//
//  SearchCoachViewController.swift
//  LeaCouch
//
//  Created by Alumnos on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit

class SearchCoachViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var coachTable: UITableView!
    @IBOutlet weak var coachSearchBar: UISearchBar!
    
    var coachesArray = [Coachesx]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpCoaches()
    }
    
    private func setUpCoaches() {
        coachesArray.append(Coachesx(name: "Maria enriquez", correo: "kevinEnriquez@correo.com", speciality: .engineer, photo: "https://www.b-plast2000.com/uploads/pics/maria_01.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Roberto Marc", correo: "RobertoEnriquez@correo.com", speciality: .profesor, photo: "https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/82/square_thumb%402x.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Richard Juarex", correo: "RichardEnriquez@correo.com", speciality: .engineer, photo: "https://www.ktbyte.com/resources/dist/assets/images/people/richard_zhou.jpg", views: 125))
        coachesArray.append(Coachesx(name: "Veronica Loo", correo: "VeronicaEnriquez@correo.com", speciality: .doctor, photo: "https://ct.yimg.com/cy/4592/38222887850_6ad7b5_128sq.jpg", views: 125))
    }
    
    //cuando agregamos UITableVieDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coachesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoachTableViewCell else {
            return UITableViewCell()
        }
        cell.nameCoachLabel.text = coachesArray[indexPath.row].name
        cell.correoCoachLabel.text = coachesArray[indexPath.row].correo
        cell.especialityCoachLabel.text = coachesArray[indexPath.row].speciality.rawValue
        //cell.coachImage.image = UIImage(named: coachesArray[indexPath.row].photo)
        cell.itemsCoachLabel.text = String(coachesArray[indexPath.row].views)
        if let url = URL(string: coachesArray[indexPath.row].photo) {
            cell.coachImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "imagen_leacoach"))
        }
        return cell
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
