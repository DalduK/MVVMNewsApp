//
//  ArticleManager.swift
//  NewsApp
//
//  Created by Przemysław Woźny on 19/04/2022.
//

import Foundation

protocol ArticleManagerDelegate {
    func didUpdateArticles<T: Codable>(_ articleManager: ArticleManager, article: T)
    func didFinishWithError(error: Error)
}

struct ArticleManager {
    let url: String
    let apiKey = "ApiKeyHere"
    var delegate: ArticleManagerDelegate?
    
    func apiCall<T: Codable>(type: T.Type, completionHandler: @escaping () -> ()) {
        guard let finalUrl = URL(string: url + apiKey) else { return }
        let urlRequest = URLRequest(url: finalUrl)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                delegate?.didFinishWithError(error: error)
                completionHandler()
                return
            }
            
            guard let data = data else {
                delegate?.didFinishWithError(error: error!)
                completionHandler()
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(type, from: data)
                delegate?.didUpdateArticles(self, article: decoded)
                completionHandler()
            } catch {
                delegate?.didFinishWithError(error: error)
                completionHandler()
            }
        }
        task.resume()
    }

}
