//
//  HomeService.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

protocol HomeCallable: AnyObject {
    func fetchTrendingMovies(completion: @escaping (MovieModel?, Error?) -> ())
}

class HomeService: HomeCallable {
    func fetchTrendingMovies(completion: @escaping (MovieModel?, Error?) -> ()) {
        let api = HomeAPI()
        // api loader
        let apiTaskLoader = APILoader(apiRequest: api)

        apiTaskLoader.loadAPIRequest(requestData: [:]) { (result, error) in
            completion(result, error)
        }
    }
}
