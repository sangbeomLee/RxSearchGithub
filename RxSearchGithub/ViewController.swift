//
//  ViewController.swift
//  RxSearchGithub
//
//  Created by 이상범 on 2020/07/01.
//  Copyright © 2020 sangbeomLee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var searchListTableView: UITableView!
    
    // searchController
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    var viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
    }

    func configureSearchController() {
        // Q
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = "NavdeepSinghh"
        searchBar.placeholder = "Enter GitHub ID, e.g., \"NavdeepSinghh\""
        searchListTableView.tableHeaderView = searchController.searchBar
        // Q
        definesPresentationContext = true
    }
}

