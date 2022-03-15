//
//  OnBoardingCollectionViewCell.swift
//  Foody
//
//  Created by THANSEEF on 15/03/22.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    //created an identifier to call this cell.
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet var ImageColletionview: UIImageView!
    @IBOutlet var desriptionLabel: UILabel!
    @IBOutlet var TitleLabel: UILabel!
    
    //MARK: - setup model
    func setup(_ slides : OnBoardingSlides){
        ImageColletionview.image = slides.image
        desriptionLabel.text = slides.descritpion
        TitleLabel.text = slides.title
    }
}
