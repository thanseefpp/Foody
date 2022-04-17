//
//  OnboardingViewController.swift
//  Foody
//
//  Created by THANSEEF on 15/03/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var pageController: UIPageControl!
    
    //initialising the slide model
    var slides : [OnBoardingSlides] = []
    
    var currentPage = 0 {
        didSet {
            pageController.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else{
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate and datasource initialised
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //assigning values to the model
        slides = [
            OnBoardingSlides(title: "Delicious Dishes", descritpion: "Experience a variety of amazing dished from different cultures around the world.", image: #imageLiteral(resourceName: "img2")),
            OnBoardingSlides(title: "Best Quality Foods", descritpion: "Our dishes are prepared by only the best", image: #imageLiteral(resourceName: "img1")),
            OnBoardingSlides(title: "Instant Fast Delivery", descritpion: "Your order will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "img3"))
        ]
        pageController.numberOfPages = slides.count // setting pagecontroller the size of array
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}


extension OnboardingViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //casting to the onboardingcollectioncell.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width:collectionView.frame.width,height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
