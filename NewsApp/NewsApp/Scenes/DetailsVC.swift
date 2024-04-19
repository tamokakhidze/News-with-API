import UIKit

class DetailsVC: UIViewController {
    
    var selectedNews: News?
    var titleLabel = UILabel()
    var timeLabel = UILabel()
    var newsTitle: String?
    var timeText: String?
    var backgroundImageView = UIImageView()
    
    init(selectedNews: News? = nil) {
        self.selectedNews = selectedNews
        super.init(nibName: nil, bundle: nil)
        title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleLabel = createTitleLabel()
        timeLabel = createTimeLabel()
        view.addSubview(titleLabel)
        view.addSubview(backgroundImageView)
        view.addSubview(timeLabel)
        configureImage()
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 359).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 314).isActive = true
//        timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
//        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 313).isActive = true
        view.sendSubviewToBack(view)
        print(timeText!)

        timeLabel.text = timeText
        titleLabel.text = newsTitle
        
    }
    
    func createTimeLabel () -> UILabel {
        let timeLabel = UILabel()
        timeLabel.textColor = .black
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        timeLabel.textAlignment = .right
        timeLabel.backgroundColor = .red
        
        return titleLabel
    }
    
    func createTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 303).isActive = true
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.setLineHeight(16.8)

        return titleLabel
    }
    
    func configureImage() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 111).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        backgroundImageView.image = UIImage(named: "Group 840")
    }
}
    

