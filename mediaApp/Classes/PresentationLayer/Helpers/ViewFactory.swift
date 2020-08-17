//
//  ViewFactory.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

class ViewFactory{
    
    static func createITunesMediaController() -> ITunesMediaViewController{
        let vc = ITunesMediaViewController(nibName: "iTunesMediaViewController", bundle: nil)
        let presenter = ITunesMediaPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
    
    static func createStorageViewController() -> StorageViewController {
        let vc = StorageViewController(nibName: "StorageViewController", bundle: nil)
        return vc
    }
}
