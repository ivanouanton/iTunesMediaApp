//
//  ITunesService.swift
//  mediaApp
//
//  Created by Anton Ivanov on 8/10/20.
//  Copyright © 2020 Anton Ivanov. All rights reserved.
//

private let iTunesServiceName = "iTunesService"

extension ServiceRegistryImplementation {
    var iTunesService: ITunesService {
        get {
            return serviceWith(name: iTunesServiceName) as! ITunesService
        }
    }
}

protocol ITunesService: Service {
    func getITunesMedia(with data: String, success: @escaping (Int, ITunesObj) -> (), failure: @escaping (Int) -> ())
}

extension ITunesService {
    var serviceName: String {
        get {
            return iTunesServiceName
        }
    }
    
    func getITunesMedia(with data: String, success: @escaping (Int, ITunesObj) -> (), failure: @escaping (Int) -> ()) {
        
        let urlString = ITunesRequestConfigurator.configureURLString(Endpoints.Search, "term", "\(data)")
        let client = NetworkClient(baseUrl: BaseURLs.iTunes)

        client.getArray(urlString: urlString, success: { (code, iTunesObjects) in
            success(code, iTunesObjects)

        }) { (code) in
            failure(code)
        }
    }
}

class ITunesServiceImplementation: ITunesService {
    
    static func register() {
        ServiceRegistry.add(service: LazyService(serviceName: iTunesServiceName, serviceGetter: {
            ITunesServiceImplementation()
        }))
    }
}
