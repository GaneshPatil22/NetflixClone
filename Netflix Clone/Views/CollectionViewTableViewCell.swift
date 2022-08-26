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
        cv.showsHorizontalScrollIndicator = false
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
        let count = self.showsOrMoviesVM.count
        print(count)
        return count == 0 ? 10 : count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TitleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        if self.showsOrMoviesVM.count > indexPath.row {
            cell.configure(with:  self.showsOrMoviesVM[indexPath.row].getPosterImageURL())
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { actions -> UIMenu? in
            let action = UIAction(title: "Add To Watchlist", image: nil, identifier: .none) { action in
            }
            let action2 = UIAction(title: "Download", image: nil, identifier: .none) { action in
            }
            return UIMenu.init(title: "Action", children: [action, action2])
        }
        return configuration
    }
}
