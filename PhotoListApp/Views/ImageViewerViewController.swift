//
//  ImageViewerViewController.swift
//  PhotoListApp
//
//  Created by techstalwarts on 13/04/24.
//

import UIKit
import Combine

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageURL = ""
    
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    
    func configureView() {
        
        if imageURL.isEmpty {
            imageView.image = UIImage(named: "photo")
        } else {
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            activityIndicator?.center = imageView.center
            activityIndicator?.tag = 100
            activityIndicator?.startAnimating()
            
            imageView.addSubview(activityIndicator!)
            cancellable = loadImage(for: imageURL).sink { [weak self] image in self?.showImage(image: image) }
        }
        
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func showImage(image: UIImage?) {
        imageView.image = image
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
    
    private func loadImage(for imageURL: String) -> AnyPublisher<UIImage?, Never> {
        return Just(imageURL)
            .flatMap({ imageURL -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: imageURL)!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ImageCache().removeImage(for: URL(string: imageURL)!)
        super.viewWillDisappear(animated)
    }
    
}
