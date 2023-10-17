//
//  ViewController.swift
//  spotlitSearch
//
//  Created by Imcrinox Mac on 25/12/1444 AH.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var movieTable: UITableView!
    
    var movieInfo : NSMutableArray!
    var selectedMovieIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovieInfo()
        configureTableView()
        navigationItem.title = "Movie"
        setUpSearchableContent()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadMovieInfo() {
        if let path = Bundle.main.path(forResource: "MoviesData", ofType: "plist") {
            movieInfo = NSMutableArray(contentsOfFile: path)
            
        }
    }
    
    func  setUpSearchableContent()
    {
        var searchItems = [CSSearchableItem]()
        
        for i in 0...(movieInfo.count - 1) {
            
            let movie = movieInfo[i] as! [String: String]
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            searchableItemAttributeSet.title = movie["Title"]!
            
            let imagePathParts = movie["Image"]!.components(separatedBy: ".")
            searchableItemAttributeSet.thumbnailURL = Bundle.main.url(forResource: imagePathParts[0], withExtension: imagePathParts[1])
            
            searchableItemAttributeSet.contentDescription = movie["Description"]!

            
            var keywords = [String]()
            let movieCategories = movie["Category"]!.components(separatedBy: " , ")
            for movieCategory in movieCategories {
                keywords.append(movieCategory)
            }
            
            let stars = movie["Stars"]!.components(separatedBy: " , ")
            for star in stars {
                keywords.append(star)
            }
            
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.appcoda.SpotIt.\(i)", domainIdentifier: "movies", attributeSet: searchableItemAttributeSet)
            
            searchItems.append(searchableItem)
            
            CSSearchableIndex.default().indexSearchableItems(searchItems) {
                if $0 != nil {
                    print($0!.localizedDescription)
                }
            }
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if activity.activityType == CSSearchableItemActionType {
            if let userInfo = activity.userInfo {
                let selectedMovie = userInfo[CSSearchableItemActionType] as! String
                selectedMovieIndex = Int(selectedMovie.components(separatedBy: ".").last!)
                performSegue(withIdentifier: "idSegueShowMovie", sender: self)
            }
        }
    }
    
    
    func configureTableView() {
        movieTable.delegate = self
        movieTable.dataSource = self
        movieTable.tableFooterView = UIView(frame: CGRect.zero)
        movieTable.register(UINib(nibName: "summaryMovieCell", bundle: nil), forCellReuseIdentifier: "idcellMovieSummary")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if movieInfo != nil{
            return movieInfo.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idcellMovieSummary", for: indexPath)
as!   summaryMovieCell
        let currentMovieInfo = movieInfo[(indexPath as NSIndexPath).row] as! [String: String]
        
        cell.movieTitle.text = currentMovieInfo["Title"]!
        cell.movieDescription.text = currentMovieInfo["Description"]!
        cell.movieRating.text = currentMovieInfo["Rating"]!
        cell.imageMVView.image = UIImage(named: currentMovieInfo["Image"]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovieIndex = (indexPath as NSIndexPath).row
        performSegue(withIdentifier: "idSegueShowMovie", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "idSegueShowMovie" {
            let  detailmoviewViewController = segue.identifier as! detailMoviewViewController
            detailmoviewViewController.movieInfo = movieInfo[selectedMovieIndex] as? [String: String]
        }
    }
}

