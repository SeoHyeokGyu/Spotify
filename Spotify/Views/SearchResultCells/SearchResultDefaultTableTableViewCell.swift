//
//  SearchResultDefaultTableTableViewCell.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/19.
//

import UIKit
import SDWebImage

class SearchResultDefaultTableTableViewCell: UITableViewCell {
    

    static let identifier = "SearchResultDefaultTableTableViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let iconimageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconimageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = contentView.height - 10
        iconimageView.frame = CGRect(x: 10, y: 0, width: imageSize, height: imageSize)
        iconimageView.layer.cornerRadius =  imageSize/2
        iconimageView.layer.masksToBounds = true
        label.frame = CGRect(x: iconimageView.right + 10, y: 0, width: contentView.width-iconimageView.right-15, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconimageView.image = nil
        label.text = nil
    }
    
    func configure(with viewModel: SearchResultDefaultTableTableViewCellViewModel) {
        label.text = viewModel.title
        iconimageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }

}
