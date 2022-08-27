//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class SearchViewController: UIViewController {
    private let discoverTableView: UITableView = {
        let tbl = UITableView()
        tbl.register(TitleTableViewCell.self)
        return tbl
    }()

    private let searchViewController: UISearchController = {
        let svc = UISearchController(searchResultsController: SearchResultViewController())
        svc.searchBar.placeholder = "Search Movie or Tv show"
        svc.searchBar.searchBarStyle = .minimal
        return svc
    }()
    var homeBusiness = HomeBusinessLayer()
    var trendingMoviesViewModel: TrendingMovieViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpNavigationBar()
        setupDelegatesAndDatasources()
        fetchDiscoverMovies()
        setUpSearchVC()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(discoverTableView)
        searchViewController.view.frame = self.view.frame

    }

    private func setUpNavigationBar() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }

    private func setUpSearchVC() {
        navigationItem.searchController = searchViewController
    }

    private func setupDelegatesAndDatasources() {
        discoverTableView.frame = self.view.bounds
        self.discoverTableView.delegate = self
        self.discoverTableView.dataSource = self
    }

}

extension SearchViewController {
    func fetchDiscoverMovies() {
        homeBusiness.getDiscoverMovies(queryParameter: ["language": "en-US", "page": "1", "sort_by": "popularity.desc", "include_adult": "false", "include_video": "false", "with_watch_monetization_types": "flatrate"]) { [weak self] model, error in
//            self.updateSection(with: .UpcommingMovies, model: model, error: error)
            self?.trendingMoviesViewModel = model
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
//                strongSelf.upcomingTableView.reloadData()
                UIView.transition(with: strongSelf.discoverTableView, duration: 1.0, options: .transitionCrossDissolve, animations: {strongSelf.discoverTableView.reloadData()}, completion: nil)
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
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


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
