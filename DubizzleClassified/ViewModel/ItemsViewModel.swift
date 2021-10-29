//
//  ItemsViewModel.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import UIKit
import IHProgressHUD

class ItemsViewModel: NSObject {

    private var apiService: APIService!
    private(set) var items: Items! {
        didSet {
            self.bindItemsViewModelToController()
        }
    }
    
    var bindItemsViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        getItemsData()
    }
    
    func getItemsData() {
        IHProgressHUD.show()
        self.apiService.apiToGetItemsData { items in
            self.items = items
        }
    }
}
