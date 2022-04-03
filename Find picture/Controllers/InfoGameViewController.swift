//
//  InfoGameViewController.swift
//  Find number
//
//  Created by Роман on 27.03.2022.
//

import UIKit

class InfoGameViewController: UIViewController {

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContraint()
    }
        
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(infoLabel)
    }
    
    func setupContraint() {
        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
     //       infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
     //       infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

