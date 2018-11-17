//
//  SearchPublicationsViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/16/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class SearchPublicationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var publicationTable: UITableView!
    @IBOutlet weak var searchPublicationBar: UISearchBar!
    
    var publications: [Publication] = []
    var currentePublications: [Publication] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpPublications()
        setUpSearchBar()
    }
    
    // set data
    func setUpPublications() {
        Alamofire.request(NewApiTutor.publicationsUrl).validate()
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
                    let jsonPublications = json["publications"].arrayValue
                    self.publications = Publication.buildAll(jsonPublications: jsonPublications) // falta det
                    self.currentePublications = self.publications
                    self.publicationTable!.reloadData()
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                }
            })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentePublications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell.nameCoachLabel.text = currentCoachArray[indexPath.row].name
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? PublicationsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titlePublicationLabel.text = currentePublications[indexPath.row].name
        cell.datePublicationLabel.text = currentePublications[indexPath.row].date
        cell.descriptionPublicationLabel.text = currentePublications[indexPath.row].description
        cell.viewsPublicationLabel.text = String(currentePublications[indexPath.row].views)
        
        if let url = URL(string: currentePublications[indexPath.row].url) {
            cell.picturePublicationImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "file-unavailable"))
        }
        return cell
    }

    // when I add UITableViewdelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //to searchBar, add UISearchBarDelegate y vamos a su efinicion y copiamos las dos funciones de searchBar
    private func setUpSearchBar() {
        searchPublicationBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // to reload if not search and lower-uper case
        guard !searchText.isEmpty else {
            currentePublications = publications
            publicationTable.reloadData()
            return
        }
        currentePublications = publications.filter({ myPublication -> Bool in
            myPublication.name.lowercased().contains(searchText.lowercased())
            
        })
        publicationTable.reloadData()
    }
    //search all
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    //cancel search
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentePublications = publications
        searchBar.text = ""
        publicationTable.reloadData()
    }
    
    //AboutPublications
    var currentItemPublication: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSearchPublication" {
            let aboutPublicationViewController = (segue.destination as! UINavigationController).viewControllers.first as! AboutPublicationViewController
            aboutPublicationViewController.myAboutPublication = currentePublications[currentItemPublication]
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        publicationTable.reloadData()
        currentItemPublication = indexPath.row
        self.performSegue(withIdentifier: "showSearchPublication", sender: self)
        
    }
    
}
