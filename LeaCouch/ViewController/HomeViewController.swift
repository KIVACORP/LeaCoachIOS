//
//  HomeViewController.swift
//  LeaCouch
//
//  Created by ALEXIS-PC on 11/8/18.
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
    
    func updateValues(from publication: Publication) {
        if let url = URL(string: publication.url) {
            publicationImage.af_setImage(withURL: url, placeholderImage: UIImage(named: "file-unavailable"))
        }
        namePublicationLabel.text = publication.name
        datePublicationLabel.text = publication.date
        descriptionPublicationLabel.text = publication.description
        viewsPublicationLabel.text = String(publication.views)
    }
}
class HomeViewController: UICollectionViewController {
    var publications: [Publication] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDataPublication()
    }

    func updateDataPublication() {
        Alamofire.request(NewApiTutor.publicationsUrl)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    let jsonPublications = json["publications"].arrayValue
                    self.publications = Publication.buildAll(from: jsonPublications) // falta det
                case .failure(let error):
                    print(error)
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
        cell.updateView(from: publications[indexPath.row])
        return cell
    }


}
