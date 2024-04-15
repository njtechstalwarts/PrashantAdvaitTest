//
//  PhotoCollectionViewCell.swift
//  PhotoListApp
//
//  Created by techstalwarts on 13/04/24.
//

import UIKit
import Combine

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    var activityIndicator: UIActivityIndicatorView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        //        imageView.alpha = 0.0
        //        animator?.stopAnimation(true)
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        cancellable?.cancel()
    }
    
    func configureCell(imageURL: String) {
        
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
    
    private func showImage(image: UIImage?) {
        //        imageView.alpha = 0.0
        //        animator?.stopAnimation(false)
        imageView.image = image
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
        //        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: { [weak self] in
        //            self?.imageView.alpha = 1.0
        //
        //        })
    }
    
    private func loadImage(for imageURL: String) -> AnyPublisher<UIImage?, Never> {
        return Just(imageURL)
            .flatMap({ imageURL -> AnyPublisher<UIImage?, Never> in
                let url = URL(string: imageURL)!
                return ImageLoader.shared.loadImage(from: url)
            })
            .eraseToAnyPublisher()
    }
    
}
