//
//  HomeViewController.swift
//  LeaCouch
//
//  Created by Jerber Valentin on 11/8/18.
//  Copyright © 2018 KIVA. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

private let reuseIdentifier = "Cell"

class PublicationCell: UICollectionViewCell {
    @IBOutlet weak var publicationImage: UIImageView!
    @IBOutlet weak var descriptionPublicationLabel: UILabel!
    @IBOutlet weak var viewsPublicationLabel: UILabel!
    @IBOutlet weak var datePublicationLabel: UILabel!
    @IBOutlet weak var namePublicationLabel: UILabel!
    
    func updatePublicationsValues(from publication: Publication) {
        if let url = URL(string: publication.url) {
            publicationImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "file-unavailable"))
        }
        namePublicationLabel.text = publication.name
        //datePublicationLabel.text = publication.date
        //descriptionPublicationLabel.text = publication.description
        //viewsPublicationLabel.text = String(publication.views)
    }
}
class HomeViewController: UICollectionViewController {
    var publications: [Publication] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDataPublication()
    }

    func updateDataPublication() {
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
                    self.collectionView!.reloadData()
                case .failure(let error):
                    print("Response Error: \(error.localizedDescription)")
                }
            })
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return publications.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PublicationCell
    
        // Configure the cell
        cell.updatePublicationsValues(from: publications[indexPath.row])
        return cell
    }

    //AboutPublications
    var currentItemPublication: Int = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMyPublication" {
            let aboutPublicationViewController = (segue.destination as! UINavigationController).viewControllers.first as! AboutPublicationViewController
            aboutPublicationViewController.myAboutPublication = publications[currentItemPublication]
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentItemPublication = indexPath.row
        self.performSegue(withIdentifier: "showMyPublication", sender: self)
    }

    
}
