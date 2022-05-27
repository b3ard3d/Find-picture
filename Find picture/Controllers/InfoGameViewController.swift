//
//  InfoGameViewController.swift
//  Find number
//
//  Created by Роман on 27.03.2022.
//

import UIKit

class InfoGameViewController: UIViewController {

    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "info"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "В начале игры показывается расположение картинок, каждой картинки по 2, после начала игры, картинки скрываются, необходимо по памяти открывать одинаковые картинки, если угадали расположение, картинки исчезают, в случае неудачи, снова скрываются"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContraint()
    }
        
    func setupView() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
        view.addSubview(infoImageView)
        view.addSubview(infoLabel)
    }
    
    func setupContraint() {
        NSLayoutConstraint.activate([
            infoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoImageView.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -16),
            infoImageView.widthAnchor.constraint(equalToConstant: 50),
            infoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            infoLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

