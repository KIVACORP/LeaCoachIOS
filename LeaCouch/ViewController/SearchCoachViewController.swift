//
//  SearchCoachViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class SearchCoachViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var coachTable: UITableView!
    @IBOutlet weak var coachSearchBar: UISearchBar!
    
    var tutors: [Tutor] = []
    var currentTutors: [Tutor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpResults()
        setUpSearchBar()
        
    }
    
    // set data
    func setUpResults() {
        Alamofire.request(NewApiTutor.tutorsUrl).validate()
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let status = json["status"].stringValue
                    if status == "error" {
                        print("Tutor Api Error: \(json["message"].stringValue)")
                        return
                    }
                    //print("\(json)")
                    let jsonResults = json["tutors"].arrayValue
                    self.tutors = Tutor.buildAll(from: jsonResults)
                    self.currentTutors = self.tutors
                    self.coachTable!.reloadData()
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                }
            })
    }
    
    
    //Table, cuando agregamos UITableVieDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoachTableViewCell else {
            return UITableViewCell()
        }
               
        // to update table search
        //cambiar currentCoachArray por currentResults
        cell.nameCoachLabel.text = currentTutors[indexPath.row].name
        cell.correoCoachLabel.text = currentTutors[indexPath.row].email
        cell.especialityCoachLabel.text = currentTutors[indexPath.row].description
        cell.itemsCoachLabel.text = String(currentTutors[indexPath.row].likes)
        if let url = URL(string: currentTutors[indexPath.row].url_Image) {
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
            currentTutors = tutors
            coachTable.reloadData()
            return
        }
        currentTutors = tutors.filter({ coach -> Bool in
            coach.name.lowercased().contains(searchText.lowercased())
            
        })
        coachTable.reloadData()
    }
    //search all
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    //cancel search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentTutors = tutors
        searchBar.text = ""
        coachTable.reloadData()
    }
    
    
    //About tutors
    var currentItemtutor: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAboutTutor" {
            let aboutTutorViewController = (segue.destination as! UINavigationController).viewControllers.first as! AboutTutorViewController
            aboutTutorViewController.myAboutTutor = currentTutors[currentItemtutor]
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coachTable.reloadData()
        currentItemtutor = indexPath.row
        self.performSegue(withIdentifier: "ShowAboutTutor", sender: self)
        
    }
    
}
