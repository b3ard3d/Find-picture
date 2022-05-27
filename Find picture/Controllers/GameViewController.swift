//
//  ViewController.swift
//  Find number
//
//  Created by Роман on 26.03.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    var selectedImage: String?
    var selectCellOne: Bool = false
    var selectCellTwo: Bool = false
    
    var selectOne: Bool = false
    var selectTwo: Bool = false
    var selectThree: Bool = false

    var selectedIndexPathOne, selectedIndexPathTwo: IndexPath?
    var selectedImageCellOne, selectedImageCellTwo: UIImage?
    
    var selectIndexOne, selectIndexTwo: IndexPath?
        
    private enum Constants {
        static let itemCount: CGFloat = 4
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        //collectionView.backgroundColor = .systemGray5
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCollectionCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var gameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать игру", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.gameButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.newGameButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    private var pictureData: [String] = [ "1.jpeg",
                                         "2.jpeg",
                                         "3.jpeg",
                                         "4.jpeg",
                                         "5.jpeg",
                                         "6.jpeg",
                                         "7.jpeg",
                                         "8.jpeg",
                                         "9.jpeg",
                                         "10.jpeg",
                                         "11.jpeg",
                                         "12.jpeg",
                                         "13.jpeg",
                                         "14.jpeg",
                                         "15.jpeg",
                                         "16.jpeg"]
    
    private var dataSource: [String] = []
    private var tempDataSource: [String] = []
    private var collectionDataSource: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContraint()
        initCollectionDataSource()
    }
        
    func setupView() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpeg")!)
        //view.backgroundColor = .systemGray5
        collectionView.isUserInteractionEnabled = false
        view.addSubview(collectionView)
        view.addSubview(gameButton)
        view.addSubview(newGameButton)

    }
    
    func setupContraint() {
        NSLayoutConstraint.activate([
            collectionView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            collectionView.heightAnchor.constraint(equalToConstant: 400),
            
            gameButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            gameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            gameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            gameButton.heightAnchor.constraint(equalToConstant: 50),
            
            newGameButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            newGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            newGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            newGameButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func initCollectionDataSource() {
        collectionDataSource = []
        dataSource = []
        dataSource = pictureData
        for _ in 0...(Int(Constants.itemCount) * 2) - 1 {
            let tempIndex = Int.random(in: 0...dataSource.count - 1)
            self.tempDataSource.append(dataSource[tempIndex])
            self.tempDataSource.append(dataSource[tempIndex])
            self.dataSource.remove(at: tempIndex)
        }
        for _ in 0...(tempDataSource.count) - 1 {
            let tempIndex = Int.random(in: 0...tempDataSource.count - 1)
            self.collectionDataSource.append(tempDataSource[tempIndex])
            self.tempDataSource.remove(at: tempIndex)
        }
    }
    
    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - (Constants.itemCount + 1) * spacing
        let itemWidth = floor(neededWidth / Constants.itemCount)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc func gameButtonClicked() {
        collectionView.isUserInteractionEnabled = true
        
        for i in collectionView.indexPathsForVisibleItems {
            collectionView.cellForItem(at: i)?.contentView.isHidden = true
        }
        UIView.animate(withDuration: 0.5) {
            self.gameButton.isHidden = true
        }
    }
    
    @objc func newGameButtonClicked() {
        
        
        for i in collectionView.visibleCells {
            i.isHidden = false
            i.contentView.isHidden = false
        }
        initCollectionDataSource()
        collectionView.isUserInteractionEnabled = false
        collectionView.reloadData()                
        UIView.animate(withDuration: 0.5) {
            self.gameButton.isHidden = false
            self.newGameButton.isHidden = true
        }
    }
}

extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(Constants.itemCount * Constants.itemCount)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCollectionCell", for: indexPath)
            cell.backgroundColor = .black
            return cell
        }
        cell.backgroundColor = .systemGray5
        cell.pictureImages.image = UIImage(named: collectionDataSource[indexPath.row])
        
        if (selectCellOne && indexPath == selectedIndexPathOne) || (selectCellTwo && indexPath == selectedIndexPathTwo) {
            cell.pictureImages.alpha = 1
        }
        if selectedIndexPathOne != nil && indexPath == selectedIndexPathOne {
            selectedImageCellOne = cell.pictureImages.image
        }
        if selectedIndexPathTwo != nil && indexPath == selectedIndexPathTwo {
            selectedImageCellTwo = cell.pictureImages.image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        let spacing = ( collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        if selectCellOne == false {
            selectCellOne = true
            selectedIndexPathOne = indexPath
            collectionView.reloadItems(at: [indexPath])
            collectionView.cellForItem(at: indexPath)?.contentView.isHidden = false
        } else if selectCellTwo == false {
            selectCellTwo = true
            selectedIndexPathTwo = indexPath
            collectionView.reloadItems(at: [indexPath])
            collectionView.cellForItem(at: indexPath)?.contentView.isHidden = false
        }
        
        if selectOne == false {
            selectOne = true
            selectIndexOne = indexPath
        } else if selectTwo == false {
            selectTwo = true
            selectIndexTwo = indexPath
        } else if selectThree == false {
            selectThree = true
        }
        
        if selectedIndexPathOne != nil && selectedIndexPathTwo != nil && selectedImageCellOne != nil && selectedImageCellTwo != nil && selectedImageCellOne == selectedImageCellTwo && selectedIndexPathOne != selectedIndexPathTwo {
            collectionView.cellForItem(at: selectedIndexPathOne!)?.isHidden = true
            collectionView.cellForItem(at: selectedIndexPathTwo!)?.isHidden = true

            selectedIndexPathOne = nil
            selectedIndexPathTwo = nil
            selectCellOne = false
            selectCellTwo = false
            
        } else if selectedIndexPathOne != nil && selectedIndexPathTwo != nil && selectedImageCellOne != nil && selectedImageCellTwo != nil && selectedImageCellOne != selectedImageCellTwo {
            selectedIndexPathOne = nil
            selectedIndexPathTwo = nil
            selectCellOne = false
            selectCellTwo = false
            selectedImageCellOne = nil
            selectedImageCellTwo = nil

        } else if selectedIndexPathOne != nil && selectedIndexPathTwo != nil && selectedIndexPathOne == selectedIndexPathTwo {            
            selectedIndexPathOne = nil
            selectedIndexPathTwo = nil
            selectCellOne = false
            selectCellTwo = false
            selectedImageCellOne = nil
            selectedImageCellTwo = nil
        }
        
        if selectOne == true && selectTwo == true && selectThree == true {
            collectionView.cellForItem(at: selectIndexOne!)?.contentView.isHidden = true
            collectionView.cellForItem(at: selectIndexTwo!)?.contentView.isHidden = true
            selectOne = true
            selectTwo = false
            selectThree = false
            
            selectCellOne = true
            selectedIndexPathOne = indexPath
            
            selectIndexOne = indexPath
            selectIndexTwo = nil
        }
        
        //считается количество скрытых ячеек и если все ячейки срыты показывается кнопка начать заново
        var numberOfHidden = 0
        for i in collectionView.indexPathsForVisibleItems {
            if ((collectionView.cellForItem(at: i)?.isHidden) == true) {
                numberOfHidden += 1
            }
            if numberOfHidden == collectionView.visibleCells.endIndex {
                newGameButton.isHidden = false

            }
        }
    }
}


