//
//  StorageViewController.swift
//  mediaApp
//
//  Created by Антон Иванов on 8/16/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit

class StorageViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var presenter: StoragePresenterProtocol!
    
    private var iTunesObjs: [Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: ITunesObjTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ITunesObjTableViewCell.identifier)
        presenter.fetchSavedData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let objects = DataProvider().objects(StoreMediaObj.self)
        print("Itunes objects count is: \(String(describing: objects?.count))")
    }

}

extension StorageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iTunesObjs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ITunesObjTableViewCell.identifier, for: indexPath) as! ITunesObjTableViewCell
        
        cell.titleLbl?.text = iTunesObjs[indexPath.row].trackName
        cell.typeLbl?.text = iTunesObjs[indexPath.row].kind
        
        return cell
    }
}

extension StorageViewController: StorageViewProtocol {
    func updateList(with data: [Media]) {
        iTunesObjs = data
        tableView.reloadData()
    }
}
