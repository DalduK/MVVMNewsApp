//
//  ViewController.swift
//  NewsApp
//
//  Created by Przemysław Woźny on 18/04/2022.
//

import UIKit

class SportViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = ApiViewModel(url: "https://newsapi.org/v2/top-headlines?country=pl&category=sport&apiKey=")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sport"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        viewModel.articleManager?.apiCall(type: Welcome.self) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SportViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.articles.bind { article in
            showTutorial(article[indexPath.row].url) { results in
                switch results {
                case .success(let vc):
                    self.present(vc, animated: true, completion: nil)
                case .failure(let error):
                    print(error)
                }
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SportViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var articleTemp = Array<Article>()
        viewModel.articles.bind { article in
            articleTemp = article
        }
        return articleTemp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
        viewModel.articles.bind { article in
            cell.title.text = article[indexPath.row].title
            cell.dateCreation.text = article[indexPath.row].publishedAt
            cell.pageSource.text = article[indexPath.row].source.name
        }
        return cell

    }
    
    
}
