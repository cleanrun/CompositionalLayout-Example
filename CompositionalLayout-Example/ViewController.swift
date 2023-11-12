//
//  ViewController.swift
//  CompositionalLayout-Example
//
//  Created by cleanmac on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var appsListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        return collectionView
    }()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(appsListCollectionView)
        NSLayoutConstraint.activate([
            appsListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            appsListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            appsListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appsListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCompositionalLayout()
    }
    
    private func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [unowned self] section, environment in
            return switch section {
            case 0:
                self.getAppCardsListLayout()
            case 1:
                self.getAppGroupedListLayout()
            default:
                self.getAppListLayout()
            }
        }
        appsListCollectionView.setCollectionViewLayout(layout, animated: true)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return switch section {
        case 0:
            5
        case 1:
            12
        default:
            6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
        cell.backgroundColor = .random
        cell.layer.cornerRadius = 10
        return cell
    }
    
}
