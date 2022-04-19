//
//  WebsiteManager.swift
//  NewsApp
//
//  Created by Przemysław Woźny on 19/04/2022.
//

import UIKit
import SafariServices
enum ErrorCase: Error {
case couldntOpenURL
}

func showTutorial(_ url: String, completionHandler: @escaping (Result<SFSafariViewController,Error>) -> Void) {
    if let url = URL(string: url) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true

        let vc = SFSafariViewController(url: url, configuration: config)
        completionHandler(.success(vc))
    } else {
        completionHandler(.failure(ErrorCase.couldntOpenURL))
    }
}
