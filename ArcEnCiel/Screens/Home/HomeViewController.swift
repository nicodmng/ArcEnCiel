//
//  HomeView.swift
//  ArcEnCiel
//
//  Created by Nicolas Demange on 05/01/2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var homeViewModel: HomeViewModel!
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        
        button.backgroundColor = .systemBlue
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        // Shadow
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        
        // Corner radius
        button.layer.cornerRadius = 35
        return button
    }()
    
    // MARK: - IBOutlets & IBActions
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statutLabel: UILabel!
    @IBOutlet weak var profilImageView: UIImageView!
    
    @IBOutlet weak var infoCollectionView: UICollectionView!
    @IBOutlet weak var nextEventCollectionView: UICollectionView!
    
    @IBAction func profilButton(_ sender: UIButton) {
        print("Test button OK")
    }
    
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilImageView.makeRounded()
        
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        let nibName = UINib(nibName: "InfoViewCell", bundle: nil)
        infoCollectionView.register(nibName, forCellWithReuseIdentifier: "infoCell")
        
        let nibName2 = UINib(nibName: "NextEventViewCell", bundle: nil)
        nextEventCollectionView.register(nibName2, forCellWithReuseIdentifier: "nextEventCell")
    }
    
    // MARK: - Methods
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 60 - 30,
                                      y: view.frame.size.height - 180,
                                      width: 70,
                                      height: 70)
    }
    
    @objc private func didTapButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        let addEventVC = storyboard.instantiateViewController(withIdentifier: "addEvent")
        
        addEventVC.modalPresentationStyle = .formSheet
        
        present(addEventVC, animated: true, completion: .none)
    }
    
}

// MARK: Extensions

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == infoCollectionView {
            return CGSize(width: 243.0, height: 182.0)
        } else if collectionView == nextEventCollectionView {
            return CGSize(width: 296.0, height: 172.0)
        }
        return CGSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == infoCollectionView {
            return 10
        } else if collectionView == nextEventCollectionView {
            return 5
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.infoCollectionView {
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath)
            return infoCell
        } else if collectionView == self.nextEventCollectionView {
            let nextEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "nextEventCell", for: indexPath)
            return nextEventCell
        }
        return UICollectionViewCell()
    }
    
}
