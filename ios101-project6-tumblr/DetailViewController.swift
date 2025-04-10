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
    @IBOutlet weak var postDetails: UITextView!
  
    @IBOutlet weak var imagePost: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print("ℹ️ DetailViewController viewDidLoad")
            // Make sure views are loaded before configuring
            guard post != nil else {
                print("Warning: No post set for detail view")
                return
            }
        }
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("ℹ️ DetailViewController viewWillAppear")
            configureView()
        }
        
        private func configureView() {
            print("ℹ️ Configuring view with post: \(post?.summary ?? "nil")")
            // Make sure views and post are loaded
            guard let post = post, isViewLoaded else {
                print("⚠️ No post available to configure view")
                return
            }
            
            guard isViewLoaded else {
                    print("⚠️ Views not loaded yet")
                    return
                }
            
            // Set the text with HTML tags removed
            postDetails.text = post.caption.trimHTMLTags()
            print("ℹ️ Set text: \(String(describing: post.caption.trimHTMLTags()))")
            
            // Loading image if available
            if let photo = post.photos.first {
                let url = photo.originalSize.url
                print("ℹ️ Loading image from URL: \(url)")
                Nuke.loadImage(with: url, into: imagePost)
            }
        }
    
    // debug logs and checks
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
