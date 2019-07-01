//
//  MediaViewController.swift
//  ShiningStars
//
//  Created by Jal Irani on 3/2/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit
import INSPhotoGallery

class MediaViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var useCustomOverlay = false
    
    //            INSPhoto(imageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg"), thumbnailImageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg")),
    //            INSPhoto(imageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg"), thumbnailImageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg")),
    //            INSPhoto(imageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg"), thumbnailImageURL: URL(string: "http://inspace.io/assets/portfolio/thumb/6-d793b947f57cc3df688eeb1d36b04ddb.jpg"))
    //            INSPhoto(imageURL: URL(string: "http://scontent.cdninstagram.com/t51.2885-15/s480x480/e35/16122719_1181034925345942_4797100224747143168_n.jpg?ig_cache_key=MTQzMTE2MjA4NzIzMzAyMTY1MA%3D%3D.2"), thumbnailImage: UIImage(named: "thumbnailImage")),
    
    // http://www.shiningstarsnetwork.org/images/IMG_5380.jpg
    
    lazy var photos: [INSPhotoViewable] = {
        return [
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/ElizabethGxmas_1.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/ElizabethGxmas_1.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/CaitlinCrewJPG.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/CaitlinCrewJPG.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/36231321400_f9ac44783a_k.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/36231321400_f9ac44783a_k.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/Gina_Giselle.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/Gina_Giselle.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/TerrellXmas.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/TerrellXmas.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/AlejandroHollywood.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/AlejandroHollywood.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/BrianMacShout.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/BrianMacShout.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/AdamJoeSarah.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/AdamJoeSarah.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/Gerard1.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/Gerard1.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/IMG_4647.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/IMG_4647.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/GinaDorothy.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/GinaDorothy.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/P1010217.JPG"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/P1010217.JPG")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/STWteam2019.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/STWteam2019.jpg")),
            INSPhoto(imageURL: URL(string: "http://www.shiningstarsnetwork.org/images/IMG_5380.jpg"), thumbnailImageURL: URL(string: "http://www.shiningstarsnetwork.org/images/IMG_5380.jpg"))
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension MediaViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as! MediaTableViewCell
        cell.populateWithPhoto(photos[(indexPath as NSIndexPath).row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MediaTableViewCell
        let currentPhoto = photos[(indexPath as NSIndexPath).row]
        let galleryPreview = INSPhotosViewController(photos: photos, initialPhoto: currentPhoto, referenceView: cell)
        
        galleryPreview.referenceViewForPhotoWhenDismissingHandler = { [weak self] photo in
            if let index = self?.photos.index(where: {$0 === photo}) {
                let indexPath = IndexPath(item: index, section: 0)
                return collectionView.cellForItem(at: indexPath) as? MediaTableViewCell
            }
            return nil
        }
        present(galleryPreview, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.frame.size.width)/2) - 6, height: 145)
    }
}
