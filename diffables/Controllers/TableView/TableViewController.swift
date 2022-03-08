//
//  TableViewController.swift
//  diffables
//
//  Created by @karthi on 08/03/22.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let iconSet = ItemList.shared.iconSet
    
    lazy var dataSource = configureDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = dataSource
        updateSnapshot()
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
     
        // Create a snapshot and populate the data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Icon>()
        snapshot.appendSections([.all])
        snapshot.appendItems(iconSet, toSection: .all)
     
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, Icon> {

        let dataSource = UITableViewDiffableDataSource<Section, Icon>(tableView: tableView, cellProvider: { tableView, indexPath, icon in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
            cell.iconImageView.image = UIImage(named: icon.name)
            cell.iconPriceLabel.text = "\(icon.price) Rs"
            return cell
        })
        return dataSource
    }

    // MARK: - Navigation
    class func initWithStory() -> TableViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        return vc
    }

}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconPriceLabel: UILabel!
}
