//
//  HomeBusiness.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

class HomeBusinessLayer {

    private lazy var homeService = HomeService()

    // MARK: -
    func getTrendingMovies(completion:@escaping ((_ model: TrendingMovieViewModel?, _ error: Error?) -> ()) ) {
        homeService.fetchTrendingMovies() { (response, error) in
            if let response = response {
                completion(TrendingMovieViewModel(model: response), nil)
            } else {
                completion(nil, error)
            }
        }
    }

    func getTrendingTVShows(completion:@escaping ((_ model: TrendingMovieViewModel?, _ error: Error?) -> ()) ) {
        homeService.fetchTrendingTVShows() { (response, error) in
            if let response = response {
                completion(TrendingMovieViewModel(model: response), nil)
            } else {
                completion(nil, error)
            }
        }
    }

    func getUpcommingMovies(queryParameter: [String: String], completion:@escaping ((_ model: TrendingMovieViewModel?, _ error: Error?) -> ()) ) {
        homeService.fetchUpcommingMovies(queryParameter: queryParameter) { (response, error) in
            if let response = response {
                completion(TrendingMovieViewModel(model: response), nil)
            } else {
                completion(nil, error)
            }
        }
    }

    func getPopularMovies(queryParameter: [String: String], completion:@escaping ((_ model: TrendingMovieViewModel?, _ error: Error?) -> ()) ) {
        homeService.fetchPopularMovies(queryParameter: queryParameter) { (response, error) in
            if let response = response {
                completion(TrendingMovieViewModel(model: response), nil)
            } else {
                completion(nil, error)
            }
        }
    }

    func getTopRatedMovies(queryParameter: [String: String], completion:@escaping ((_ model: TrendingMovieViewModel?, _ error: Error?) -> ()) ) {
        homeService.fetchTopRatedMovies(queryParameter: queryParameter) { (response, error) in
            if let response = response {
                completion(TrendingMovieViewModel(model: response), nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
