//
//  SearchResultSubtitleTableViewCell.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/19.
//

import UIKit
import SDWebImage

class SearchResultSubtitleTableViewCell: UITableViewCell {
    

    static let identifier = "SearchResultSubtitleTableViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let subTitlelabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
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
        contentView.addSubview(subTitlelabel)
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
        let labelHeight = contentView.height/2
        label.frame = CGRect(
            x: iconimageView.right + 10,
            y: 0,
            width: contentView.width-iconimageView.right-15,
            height: labelHeight
        )
        
        subTitlelabel.frame = CGRect(
            x: iconimageView.right + 10,
            y: label.bottom,
            width: contentView.width-iconimageView.right-15,
            height: labelHeight
        )

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconimageView.image = nil
        label.text = nil
        subTitlelabel.text = nil
    }
    
    func configure(with viewModel: SearchResultSubtitleTableViewCellViewModel) {
        label.text = viewModel.title
        subTitlelabel.text = viewModel.subtitle
        iconimageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }

}
