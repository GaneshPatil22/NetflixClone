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
    func getTrendingMovies(completion:@escaping ((_ model: MovieModel?, _ error: Error?) -> ()) ) {
        homeService.fetchTrendingMovies() { (response, error) in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
