//
//  TrendingMovieViewModel.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

struct TrendingMovieViewModel {
    private let model: TrendingMoviesModel
    private var moviesViewModelArray: [MovieViewModel] = []

    init(model: TrendingMoviesModel) {
        self.model = model
        self.moviesViewModelArray = (model.results ?? []).map { MovieViewModel(model: $0) }
    }

    func getAllMoviesOrShows() -> [MovieViewModel] {
        return self.moviesViewModelArray
    }
}

struct MovieViewModel {
    fileprivate let model: Movie

    func getPosterImageURL() -> String {
        return model.posterPath ?? ""
    }
}
