import UIKit

class NewsCell: UITableViewCell {
    
    var timeLabel = UILabel()
    var titleLabel = UILabel()
    var backgroundImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(timeLabel)
        addSubview(titleLabel)
        addSubview(backgroundImageView)
        configureTimeLabel()
        configureTitleLabel()
        configureBackgroundImage()
        sendSubviewToBack(backgroundImageView)
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureBackgroundImage() {
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "image 5")
    }
    
    func setBackGroundImage(image: UIImage) {
        backgroundImageView.image = image
    }
    func configureTimeLabel() {
        timeLabel.font = UIFont(name: "FiraGO-Medium", size: 12)
        timeLabel.textAlignment = .center
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .white
        timeLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }
    
    func configureTitleLabel() {
        titleLabel.font = UIFont(name: "FiraGO-Medium", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.heightAnchor.constraint(equalToConstant: 38).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 303).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true        
        titleLabel.setLineHeight(16.8)


    }
    
    func configureCell(time: String, title: String) {
        timeLabel.text = time
        titleLabel.text = title
    }
    
}

