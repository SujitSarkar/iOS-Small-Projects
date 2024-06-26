//
//  DetailViewController.swift
//  Project-1
//
//  Created by Sujit Sarkar on 14/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selecedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selecedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selecedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) 
        else{
            print("No image found")
            return
        }
    
        let vc = UIActivityViewController(activityItems: [image,"This is an image for share"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
