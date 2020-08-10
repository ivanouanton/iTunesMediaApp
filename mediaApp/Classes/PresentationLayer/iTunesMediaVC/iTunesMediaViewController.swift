//
//  iTunesMediaViewController.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit
import Alamofire

class iTunesMediaViewController: UIViewController {
        @IBOutlet var tableView: UITableView!
        
        private var objects: [Media] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.dataSource = self
            tableView.register(UINib(nibName: ITunesObjTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ITunesObjTableViewCell.identifier)
            
            setupSearchBar()
            fetchITunesObjects()
        }
        
        private func setupSearchBar() {
            let search = UISearchController(searchResultsController: nil)
            search.searchResultsUpdater = self
            search.obscuresBackgroundDuringPresentation = false
            search.searchBar.placeholder = "Type something here to search"
            navigationItem.searchController = search
        }
    }

    extension iTunesMediaViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            guard let text = searchController.searchBar.text else { return }
            fetchITunesObjects(with: text)
        }
    }

    extension iTunesMediaViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return  objects.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ITunesObjTableViewCell.identifier, for: indexPath) as! ITunesObjTableViewCell
            
            cell.titleLbl?.text = objects[indexPath.row].trackName
            cell.typeLbl?.text = objects[indexPath.row].kind
            
            return cell
        }
    }


    extension iTunesMediaViewController {
        func fetchITunesObjects(with title: String = "platincoin") {
            
        // 1
        let request = Alamofire.request("https://itunes.apple.com/lookup?bundleId=com.PLCWallet.app")
        // 2
        request.responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(_):

                let decoder = JSONDecoder()
                do {
                    let itunesObjects = try decoder.decode(ITunesObj.self, from: response.data!)
                    self.objects = itunesObjects.results
                    self.tableView.reloadData()
                    print(itunesObjects)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
      }
    }
