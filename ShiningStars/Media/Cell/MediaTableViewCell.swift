//
//  MediaTableViewCell.swift
//  ShiningStars
//
//  Created by Jal Irani on 3/2/19.
//  Copyright © 2019 Jal Irani. All rights reserved.
//

import UIKit
import INSPhotoGallery

class MediaTableViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func populateWithPhoto(_ photo: INSPhotoViewable) {
        photo.loadThumbnailImageWithCompletionHandler { [weak photo] (image, error) in
            if let image = image {
                if let photo = photo as? INSPhoto {
                    photo.thumbnailImage = image
                }
                self.imageView.image = image
            }
        }
    }
}
