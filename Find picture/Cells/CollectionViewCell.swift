//
//  CollectionViewCell.swift
//  Find number
//
//  Created by Роман on 27.03.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
        
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pictureImages: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
 //       image.alpha = 0
        image.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
   //     image.addGestureRecognizer(tap)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(pictureImages)
        NSLayoutConstraint.activate([
            pictureImages.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            pictureImages.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            pictureImages.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            pictureImages.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTapGesture(){
        pictureImages.alpha = 0
        pictureImages.backgroundColor = .white
        print(pictureImages.image!)
    }
}
