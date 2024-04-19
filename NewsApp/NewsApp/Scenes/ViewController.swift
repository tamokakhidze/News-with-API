import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var arr = ["ho", "hi"]
    var newsArray = [News]()
    let imediNewsAPIUrl = "https://imedinews.ge/api/categorysidebarnews/get"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkService().getData(urlString: imediNewsAPIUrl) { (result: Result<NewsResponseData,Error>) in
            switch result {
            case .success(let success):
                self.newsArray = success.list
                self.tableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
           
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 108
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
        
        let currentNews = newsArray[indexPath.section]
        
        cell?.configureCell(time: currentNews.time, title: currentNews.title)
        //print("row: \(indexPath.row), section: \(indexPath.section) is creating")
//        var backgroundImage = UIImage(named: "your_image_name")
//        var imageUrl = newsArray[indexPath.section].url
//        var image = UIImage(named: imageUrl)
        //cell?.setBackGroundImage(image: image!)
        return cell!
       
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsItem = newsArray[indexPath.section]
        let time = newsItem.time

        if newsArray.firstIndex(where: { $0.title == newsItem.title }) != nil {
            let detailsVC = DetailsVC()
            detailsVC.newsTitle = newsItem.title
            detailsVC.timeText = time
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.layer.borderWidth = 0
            cell.layer.borderColor = nil
        }
}
