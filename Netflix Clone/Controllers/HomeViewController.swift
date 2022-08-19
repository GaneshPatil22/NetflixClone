//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    let homeTableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .grouped)
        tbl.register(CollectionViewTableViewCell.self)
        return tbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeTableView)

        self.setUpDelegates()
        self.setUpHeaderView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.homeTableView.frame = self.view.bounds
    }
}

extension HomeViewController {

    private func setUpDelegates() {
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
    }

    private func setUpHeaderView() {
        self.homeTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 450))
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollectionViewTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.textLabel?.text = "asd"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
