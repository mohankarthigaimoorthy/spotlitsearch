//
//  summaryMovieCell.swift
//  spotlitSearch
//
//  Created by Imcrinox Mac on 25/12/1444 AH.
//

import UIKit

class summaryMovieCell: UITableViewCell {

    @IBOutlet weak var imageMVView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieRating.layer.cornerRadius = movieRating.frame.size.width / 2
        movieRating.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
