//
//  ViewController.swift
//  ShimmerTest
//
//  Created by Ferhat Taşçı on 27.11.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection view'nin dataSource ve delegate'ini ayarlayın
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Collection view'nin register işlemlerini yapın
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    // UICollectionViewDataSource metotları
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // Örnek olarak 10 hücre
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Hücre içerisine Shimmer efektini uygulayın
        addShimmerEffect(to: cell)
        
        return cell
    }
    
    // Shimmer efektini uygulamak için fonksiyon
    func addShimmerEffect(to view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        let lightColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        let darkColor = UIColor(white: 0.75, alpha: 1.0).cgColor
        gradientLayer.colors = [lightColor, darkColor, lightColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.locations = [0.35, 0.5, 0.65]
        
        view.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        
        gradientLayer.add(animation, forKey: "shimmerAnimation")
    }
    
    // UICollectionViewDelegateFlowLayout metotları (hücre boyutu vb. ayarlar)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

