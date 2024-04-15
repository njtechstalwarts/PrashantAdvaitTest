//
//  PhotoViewController.swift
//  PhotoListApp
//
//  Created by techstalwarts on 13/04/24.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var pageNo = 1
    var photosList = [PhotoResponseModel]()
    var shouldHitApi = true

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getPhotos()
    }

    
    func setUpView() {
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Unsplashed Photos"
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")

    }

    func getPhotos() {
        
        Task {
            let response = try await ApiService().getPhotos(request: PhotoRequestModel(client_id: AppConstants.clientId.rawValue, page: pageNo)).async()
            
            if response.isEmpty {
                showAlert(title: "Error", message: "No Data Found")
            } else {
                if pageNo == 1 {
                    photosList = response
                } else {
                    photosList.append(contentsOf: response)
                }
                
                if response.count < 10 {
                    shouldHitApi = false
                } else {
                    pageNo += 1
                }
                collectionView.reloadData()
            }
            
        }
        
    }
    
    func showAlert(title: String, message: String) {

        GCDHelper.delay(0.5) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}


extension PhotoViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == photosList.count - 4 {
            getPhotos()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = photosList[indexPath.item]
        let vc = ImageViewerViewController(nibName: "ImageViewerViewController", bundle: nil)
        vc.imageURL = data.urls?.regular ?? ""
        vc.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present(vc, animated: true)
    }
    
}

extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = photosList[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(imageURL: data.urls?.thumb ?? "")
        return cell
    }
    
}

extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Device.screenWidth / 4, height: Device.screenWidth / 4)
    }
    
}
