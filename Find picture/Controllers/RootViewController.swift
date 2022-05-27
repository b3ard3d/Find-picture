//
//  MainTabBarController.swift
//  Find number
//
//  Created by Роман on 26.03.2022.
//

import UIKit

final class RootViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Новая игра", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
  //      button.clipsToBounds = true
  /*      button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7        */
        button.addTarget(self, action: #selector(self.newGameButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var infoGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Инфо", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
 //       button.clipsToBounds = true
  /*      button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7    */
        button.addTarget(self, action: #selector(self.infoGameButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupContraint()
    }
    
    private func setupNavigationBar() {
    //    self.navigationController?.navigationBar.prefersLargeTitles = false
    //    self.navigationItem.title = "Find number"
        navigationItem.backButtonTitle = ""
    }
        
    func setupView() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
        view.addSubview(logoImageView)
        view.addSubview(newGameButton)
        view.addSubview(infoGameButton)
    }
    
    func setupContraint() {
        let screenWidth = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      //      logoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            logoImageView.bottomAnchor.constraint(equalTo: infoGameButton.bottomAnchor),
                        
            newGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            newGameButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        //    newGameButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -50),
            newGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newGameButton.heightAnchor.constraint(equalToConstant: 50),
            
            infoGameButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 10),
            infoGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoGameButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func newGameButtonClicked() {
        navigationController?.pushViewController(GameViewController(), animated: true)
    }
    
    @objc func infoGameButtonClicked() {
        navigationController?.pushViewController(InfoGameViewController(), animated: true)
    }
}
