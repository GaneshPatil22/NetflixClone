//
//  HomeService.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

protocol HomeCallable: AnyObject {
    func fetchTrendingMovies(completion: @escaping (TrendingMoviesModel?, Error?) -> ())
    func fetchTrendingTVShows(completion: @escaping (TrendingMoviesModel?, Error?) -> ())
    func fetchUpcommingMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ())
    func fetchPopularMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ())
    func fetchTopRatedMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ())
}

class HomeService: HomeCallable {
    func fetchTrendingMovies(completion: @escaping (TrendingMoviesModel?, Error?) -> ()) {
        let api = HomeTrendingMovieAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:], queryParameter: [:]) { (result, error) in
            completion(result, error)
        }
    }

    func fetchTrendingTVShows(completion: @escaping (TrendingMoviesModel?, Error?) -> ()) {
        let api = HomeTrendingTVShowAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:], queryParameter: [:]) { (result, error) in
            completion(result, error)
        }
    }

    func fetchUpcommingMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ()) {
        let api = HomeUpcommingMovieAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:], queryParameter: queryParameter) { (result, error) in
            completion(result, error)
        }
    }

    func fetchPopularMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ()) {
        let api = HomePopularMovieAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:], queryParameter: queryParameter) { (result, error) in
            completion(result, error)
        }
    }

    func fetchTopRatedMovies(queryParameter: [String: String], completion: @escaping (TrendingMoviesModel?, Error?) -> ()) {
        let api = HomeTopRatedMovieAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:], queryParameter: queryParameter) { (result, error) in
            completion(result, error)
        }
    }
}
