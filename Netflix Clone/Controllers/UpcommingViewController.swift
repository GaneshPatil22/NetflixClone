//
//  UpcommingViewController.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class UpcommingViewController: UIViewController {

    private let upcomingTableView: UITableView = {
        let tbl = UITableView()
        tbl.register(TitleTableViewCell.self)
        tbl.showsVerticalScrollIndicator = false
        return tbl
    }()
    var homeBusiness = HomeBusinessLayer()
    var trendingMoviesViewModel: TrendingMovieViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpNavigationBar()
        setupDelegatesAndDatasources()
        fetchUpComingMovies()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(upcomingTableView)

    }

    private func setUpNavigationBar() {
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    private func setupDelegatesAndDatasources() {
        upcomingTableView.frame = self.view.bounds
        self.upcomingTableView.delegate = self
        self.upcomingTableView.dataSource = self
    }
}

extension UpcommingViewController {
    func fetchUpComingMovies() {
        homeBusiness.getUpcommingMovies(queryParameter: ["language": "en-US", "page": "1"]) { [weak self] model, error in
//            self.updateSection(with: .UpcommingMovies, model: model, error: error)
            self?.trendingMoviesViewModel = model
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
//                strongSelf.upcomingTableView.reloadData()
                UIView.transition(with: strongSelf.upcomingTableView, duration: 1.0, options: .transitionCrossDissolve, animations: {strongSelf.upcomingTableView.reloadData()}, completion: nil)
            }
        }
    }
}

extension UpcommingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMoviesViewModel?.getAllMoviesOrShows().count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TitleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let movieArr = self.trendingMoviesViewModel?.getAllMoviesOrShows()
        cell.setUpData(with: movieArr?[indexPath.row])

        return cell
    }

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
//        UIView.animate(withDuration: 0.25, animations: {
//                cell.layer.transform = CATransform3DMakeScale(1,1,1)
//            })
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
