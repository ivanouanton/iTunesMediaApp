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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let objects = DataProvider().objects(StoreMediaObj.self)
        print("Itunes objects count is: \(String(describing: objects?.count))")
    }

}

extension StorageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
