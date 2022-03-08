//
//  CollectionViewController.swift
//  diffables
//
//  Created by @karthi on 08/03/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let iconSet = ItemList.shared.iconSet
    
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 100, height: 150)
            layout.estimatedItemSize = .zero
            layout.minimumInteritemSpacing = 5
        }
        
        collectionView.dataSource = dataSource
        updateSnapshot()
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
     
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Icon>()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconSet, toSection: .all)
     
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureDataSource() -> UICollectionViewDiffableDataSource<Section, Icon> {
     
        let dataSource = UICollectionViewDiffableDataSource<Section, Icon>(collectionView: collectionView) { (collectionView, indexPath, icon) -> UICollectionViewCell? in
     
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.iconImageView.image = UIImage(named: icon.name)
            cell.iconPriceLabel.text = "\(icon.price) Rs"
     
            return cell
        }
     
        return dataSource
    }

    // MARK: - Navigation
    class func initWithStory() -> CollectionViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        return vc
    }
}

extension CollectionViewController {
    func add(_ icon: Icon, animate: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Icon>()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconSet, toSection: .all)
        self.dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }
    
    /**Update the icon list into current snapshot and apply updated snapshot into  datasource */
    func update(_ iconList: [Icon], animate: Bool = true) {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconList, toSection: .all)
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }
    
    /**Delete the icon from current snapshot and apply updated snapshot into  datasource */
    func remove(_ icon: Icon, animate: Bool = true) {
        var snapshot = dataSource.snapshot()
        snapshot.deleteItems([icon])
        dataSource.apply(snapshot, animatingDifferences: animate, completion: nil)
    }

}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconPriceLabel: UILabel!
}

enum Section {
    case all
}

