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
        
        // drive 는 main 쓰레드에 이벤트를 동작하는 subscribe다
        viewModel.data
            .drive(searchListTableView.rx.items(cellIdentifier: "SearchListTableViewCell", cellType: SearchListTableViewCell.self)) {_, repository, cell in
                cell.titleLable.text = repository.name
                cell.subtitleLabel.text = repository.url
        }
        .disposed(by: disposeBag)
        
        // text값이 nil일 경우를 대비해 orEmpty
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.data.asDriver()
            .map{ "\($0.count) Repositories" }
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
    }
    
    //MARK: - Functions
    func configureSearchController() {
        // Q
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = "sangbeomLee"
        searchBar.placeholder = "Enter GitHub ID, e.g."
        searchListTableView.tableHeaderView = searchController.searchBar
        // Q
        definesPresentationContext = true
    }
}

