//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 20/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending Tv", "Upcomming Movies ", "Top Rated"]

    let homeTableView: UITableView = {
        let tbl = UITableView(frame: .zero, style: .grouped)
        tbl.register(CollectionViewTableViewCell.self)
        return tbl
    }()

    var homeBusiness = HomeBusinessLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeTableView)

        self.setUpDelegates()
        self.configureNavBar()
        self.setUpHeaderView()
        self.fetchTrendingMovies()
        self.fetchUpcommingMoview()
        self.fetchTrendingTVShows()
        self.fetchPopularMoview()
        self.fetchTopRatedMovies()
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
        self.homeTableView.tableHeaderView = self.getHeaderView()
    }

    private func getHeaderView() -> UIView {
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width))
        return headerView
    }

    private func configureNavBar() {
        var image = UIImage(named: "NetflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image , style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    private func fetchTrendingMovies() {
        homeBusiness.getTrendingMovies { model, error in
            if let token = model {
                print(token)
            } else if let error = error as? NetworkError {
                print(error.message)
            } else if let error = error as? ServiceError {
                print(error.httpStatus, error.httpStatus)
            } else if let error = error as? UnknownParseError {
                print(error.localizedDescription)
            }
        }
    }

    private func fetchTrendingTVShows() {
        homeBusiness.getTrendingTVShows() { model, error in
            if let token = model {
                print(token)
            } else if let error = error as? NetworkError {
                print(error.message)
            } else if let error = error as? ServiceError {
                print(error.httpStatus, error.httpStatus)
            } else if let error = error as? UnknownParseError {
                print(error.localizedDescription)
            }
        }
    }

    private func fetchUpcommingMoview() {
        homeBusiness.getUpcommingMovies(queryParameter: ["language": "en-US", "page": "1"]) { model, error in
            if let token = model {
                print(token)
            } else if let error = error as? NetworkError {
                print(error.message)
            } else if let error = error as? ServiceError {
                print(error.httpStatus, error.httpStatus)
            } else if let error = error as? UnknownParseError {
                print(error.localizedDescription)
            }
        }
    }

    private func fetchPopularMoview() {
        homeBusiness.getPopularMovies(queryParameter: ["language": "en-US", "page": "1"]) { model, error in
            if let token = model {
                print(token)
            } else if let error = error as? NetworkError {
                print(error.message)
            } else if let error = error as? ServiceError {
                print(error.httpStatus, error.httpStatus)
            } else if let error = error as? UnknownParseError {
                print(error.localizedDescription)
            }
        }
    }

    private func fetchTopRatedMovies() {
        homeBusiness.getTopRatedMovies(queryParameter: ["language": "en-US", "page": "1"]) { model, error in
            if let token = model {
                print(token)
            } else if let error = error as? NetworkError {
                print(error.message)
            } else if let error = error as? ServiceError {
                print(error.httpStatus, error.httpStatus)
            } else if let error = error as? UnknownParseError {
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollectionViewTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        headerView.textLabel?.frame = CGRect(x: headerView.bounds.origin.x + 20, y: headerView.bounds.origin.y, width: 100, height: headerView.bounds.height)
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.text = headerView.textLabel?.text?.capitalizeFirstLetter()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitles[section]
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = self.view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))

        guard let header = homeTableView.tableHeaderView as? HeroHeaderUIView else { return }
        header.scrollViewDidScroll(scrollView)
    }
}
