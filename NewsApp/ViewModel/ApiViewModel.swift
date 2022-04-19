//
//  ApiViewModel.swift
//  NewsApp
//
//  Created by Przemysław Woźny on 19/04/2022.
//

import Foundation

class ApiViewModel {
    var articleManager: ArticleManager?
    let articles = Box<[Article]>([])
    
    init(url: String) {
        articleManager = ArticleManager(url: url)
        articleManager?.delegate = self
    }
    
    
}

extension ApiViewModel: ArticleManagerDelegate {
    func didFinishWithError(error: Error) {
        print(error)
    }
    
    func didUpdateArticles<T>(_ articleManager: ArticleManager, article: T) where T : Decodable, T : Encodable {
        DispatchQueue.main.async {
            let data = article as! Welcome
            self.articles.value = data.articles
        }
    }
}
