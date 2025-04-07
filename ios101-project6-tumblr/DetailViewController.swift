//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Linda  Mukundwa on 07/04/2025.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    
    // Property that stores details of the post
    var post: Post!
    
    // Connected UI elements
    @IBOutlet weak var postDetails: UILabel!
    @IBOutlet weak var imagePost: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure post exists
        guard let post = post else {
            print("Warning: No post set for detail view")
            return
        }
        
        // Setting the text safely
        postDetails?.text = post.summary
        
        // Loading image if available
        if let photo = post.photos.first {
            let url = photo.originalSize.url
            Nuke.loadImage(with: url, into: imagePost)
        }
    }
    
    // debug logs and checks
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Post details label exists: \(postDetails != nil)")
        print("Image view exists: \(imagePost != nil)")
        print("Post exists: \(post != nil)")
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
