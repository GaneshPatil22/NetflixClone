//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell, ReusableView {

    private let posterImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = bounds
    }

    public func configure(with model: String) {
        let imageURL = "http://image.tmdb.org/t/p/w500/\(model)"
        print("Image URL is: \(imageURL)")
        guard let url = URL(string: imageURL) else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
