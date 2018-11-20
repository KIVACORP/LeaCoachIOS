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
    
    var results: [ResultX] = []
    var currentResults: [ResultX] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpResults()
        setUpSearchBar()
        
    }
    
    // set data
    func setUpResults() {
        Alamofire.request(NewApiTutor.tutorUrl1).validate()
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
                    let jsonResults = json["results"].arrayValue
                    self.results = ResultX.buildAll(jsonResults: jsonResults) // falta det
                    self.currentResults = self.results
                    self.coachTable!.reloadData()
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                }
            })
    }
    
    
    //Table, cuando agregamos UITableVieDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CoachTableViewCell else {
            return UITableViewCell()
        }
               
        // to update table search
        //cambiar currentCoachArray por currentResults
        cell.nameCoachLabel.text = currentResults[indexPath.row].name
        cell.correoCoachLabel.text = currentResults[indexPath.row].link + "@gmail.com"
        cell.especialityCoachLabel.text = currentResults[indexPath.row].tag_line
        cell.itemsCoachLabel.text = String(currentResults[indexPath.row].review_rating)
        if let url = URL(string: NewApiTutor.baseUrl1 + currentResults[indexPath.row].photo) {
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
            currentResults = results
            coachTable.reloadData()
            return
        }
        currentResults = results.filter({ coach -> Bool in
            coach.name.lowercased().contains(searchText.lowercased())
            
        })
        coachTable.reloadData()
    }
    //search all
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    //cancel search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentResults = results
        searchBar.text = ""
        coachTable.reloadData()
    }
    
    
    //About tutors
    var currentItemtutor: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAboutTutor" {
            let aboutTutorViewController = (segue.destination as! UINavigationController).viewControllers.first as! AboutTutorViewController
            aboutTutorViewController.myAboutTutor = currentResults[currentItemtutor]
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coachTable.reloadData()
        currentItemtutor = indexPath.row
        self.performSegue(withIdentifier: "ShowAboutTutor", sender: self)
        
    }
    
}
