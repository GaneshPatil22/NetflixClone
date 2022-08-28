//
//  TitleTableViewCell.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 27/08/22.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell, ReusableView {

    let movieImgeView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let titleLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let playButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "play.circle"), for: .normal)
        btn.tintColor = .white
        return btn
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUIElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpUIElements() {
        contentView.addSubview(movieImgeView)
        contentView.addSubview(titleLable)
        contentView.addSubview(playButton)

        let imageViewContraints = [
            movieImgeView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImgeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            movieImgeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieImgeView.widthAnchor.constraint(equalToConstant: 80)
        ]

        let titleLabelContraints = [
            titleLable.leadingAnchor.constraint(equalTo: movieImgeView.trailingAnchor, constant: 10),
            titleLable.centerYAnchor.constraint(equalTo: movieImgeView.centerYAnchor),
            titleLable.heightAnchor.constraint(equalToConstant: 30)
        ]

        let playButtonContraints = [
            playButton.leadingAnchor.constraint(equalTo: titleLable.trailingAnchor, constant: 10),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            playButton.centerYAnchor.constraint(equalTo: movieImgeView.centerYAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.widthAnchor.constraint(equalToConstant: 30)
        ]

        NSLayoutConstraint.activate(imageViewContraints)
        NSLayoutConstraint.activate(titleLabelContraints)
        NSLayoutConstraint.activate(playButtonContraints)
    }

    func setUpData(with model: MovieViewModel?) {
        self.titleLable.text = model?.getMovieTitle()
        let imageURLString = "http://image.tmdb.org/t/p/w500/\(model?.getPosterImageURL() ?? "")"
        guard let imageURL = URL(string: imageURLString) else { return }
        self.movieImgeView.sd_setImage(with: imageURL)
    }


}
