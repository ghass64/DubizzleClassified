//
//  ViewController.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: -IBOUTLET
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - ViewModel
    private var itemsViewModel: ItemsViewModel!

    //MARK: - DataSource
    private var dataSource: ItemsTableViewDataSource<ItemTableViewCell,Result>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUIFromViewModel()
    }
    
    func updateUIFromViewModel() {
        self.itemsViewModel = ItemsViewModel()
        self.itemsViewModel.bindItemsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSource = ItemsTableViewDataSource(cellIdentifier: "ItemTableViewCell", items: self.itemsViewModel.items.results, configureCell: { (cell, itmVm) in
            cell.itemNameLabel.text = itmVm.name
            cell.itemPriceLabel.text = itmVm.price
            cell.itemPriceLabel.attributedText = AttributedString.getAttributedString(price: itmVm.price, fontSize: 11)
            cell.itemDateLabel.text = itmVm.createdAt.convertDateFormat()
            cell.itemImage.roundedView()
            let imageURL = itmVm.imageUrlsThumbnails[0]
            ImageLoader.loadURL(url: URL(string: imageURL)!, placeholder: UIImage(named:"defaultThumbnail"), cache: URLCache.shared, myImageView: cell.itemImage)

        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }

    func navigateToDeatilView(selectedItem : Result) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailsViewController") as? ItemDetailsViewController {
            vc.selectedItem = selectedItem
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedItem = itemsViewModel.items?.results[indexPath.row] {
            navigateToDeatilView(selectedItem: selectedItem)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
}
