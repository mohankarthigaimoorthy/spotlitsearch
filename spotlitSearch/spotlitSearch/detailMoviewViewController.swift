//
//  detailMoviewViewController.swift
//  spotlitSearch
//
//  Created by Imcrinox Mac on 25/12/1444 AH.
//

import UIKit

class detailMoviewViewController: UIViewController {

    @IBOutlet weak var imgmovieImage: UIImageView!
        @IBOutlet weak var moviesTitle: UILabel!
        @IBOutlet weak var moviesCategory: UILabel!
        @IBOutlet weak var moviesDescription: UILabel!
        @IBOutlet weak var moviesDirector: UILabel!
        @IBOutlet weak var moviesStars: UILabel!
        @IBOutlet weak var moviesRating: UILabel!
    var movieInfo: [String: String]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moviesRating.layer.cornerRadius = moviesRating.layer.frame.size.width / 2
        moviesRating.layer.masksToBounds = true
        
        if movieInfo != nil {
            populateMovieInfo()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func populateMovieInfo(){
        
        imgmovieImage.image = UIImage(named: movieInfo["Image"]!)
        moviesTitle.text = movieInfo["Title"]!
        moviesCategory.text = movieInfo["Category"]!
         moviesDescription.text = movieInfo["Description"]!
         moviesDirector.text = movieInfo["Director"]!
        moviesStars.text = movieInfo["Stars"]!
        moviesRating.text = movieInfo["Rating"]!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
