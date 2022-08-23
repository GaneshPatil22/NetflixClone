//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, ReusableView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TitleCollectionViewCell.self)
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    var showsOrMoviesVM: [MovieViewModel] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)

        self.setUpDelegates()
    }

    private func setUpDelegates() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.contentView.bounds
    }

    func setupMoviesData(with vm: [MovieViewModel]) {
        self.showsOrMoviesVM = vm
        self.collectionView.reloadData()
    }

}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.showsOrMoviesVM.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TitleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with:  self.showsOrMoviesVM[indexPath.row].getPosterImageURL())
        return cell
    }
}
