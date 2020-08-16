//
//  iTunesMediaViewController.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit
import Alamofire

class ITunesMediaViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: ITunesMediaPresenterProtocol!
    
    let searchController = UISearchController(searchResultsController: nil)
    private var objects: [Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ITunesObjTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ITunesObjTableViewCell.identifier)
        
        setupSearchController()
    }
    
    private func setupSearchController() {
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
    }
}

extension ITunesMediaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ITunesObjTableViewCell.identifier, for: indexPath) as! ITunesObjTableViewCell
        
        cell.titleLbl?.text = objects[indexPath.row].trackName
        cell.typeLbl?.text = objects[indexPath.row].kind
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = objects.count - 5
        if indexPath.row == lastItem {
            presenter.loadMore()
        }
    }
}

extension ITunesMediaViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.text = ""
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(reloadIfNeeded), object: searchBar)
        perform(#selector(reloadIfNeeded), with: searchBar, afterDelay: 0.75)
    }
    
    @objc func reloadIfNeeded(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            print("nothing to search")
            return
        }
        
        presenter.fetchData(with: query)
    }
}

extension ITunesMediaViewController: ITunesMediaViewProtocol {
    func showModalError(with message: String) {
        
    }
    
    func updateList(with data: [Media]) {
        objects = data
        tableView.reloadData()
    }
    
    func updateMore(with data: [Media]) {
        objects.append(contentsOf: data)
        tableView.reloadData()
    }
}
