//
//  StorageViewController.swift
//  mediaApp
//
//  Created by Антон Иванов on 8/16/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

import UIKit
import AVKit

class StorageViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var presenter: StoragePresenterProtocol!
    
    private var iTunesObjs: [Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: ITunesObjTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ITunesObjTableViewCell.identifier)
        presenter.fetchSavedData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete the item?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
            try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            try? AVAudioSession.sharedInstance().setActive(true)
            self.presenter.remove(with: self.iTunesObjs[indexPath.row])
        }))
        
        self.present(alert, animated: true)
    }
}

extension StorageViewController: StorageViewProtocol {
    func updateList(with data: [Media]) {
        iTunesObjs = data
        tableView.reloadData()
    }
}
