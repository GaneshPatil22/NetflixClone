//
//  HomeAPI.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

struct HomeTrendingMovieAPI: APIHandler {
    func makeRequest(from parameters: [String: Any], queryParameters: [String: String]) -> Request {
        let url = URL(string: Path().trendingMovies)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        set(parameters, urlRequest: &urlRequest)
        setQueryParameters(with: queryParameters, urlRequest: &urlRequest)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> TrendingMoviesModel {
        return try defaultParseResponse(data: data)
    }
}

struct HomeTrendingTVShowAPI: APIHandler {
    func makeRequest(from parameters: [String: Any], queryParameters: [String: String]) -> Request {
        let url = URL(string: Path().trendingTVShows)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        set(parameters, urlRequest: &urlRequest)
        setQueryParameters(with: queryParameters, urlRequest: &urlRequest)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> TrendingMoviesModel {
        return try defaultParseResponse(data: data)
    }
}

struct HomeUpcommingMovieAPI: APIHandler {
    func makeRequest(from parameters: [String: Any], queryParameters: [String: String]) -> Request {
        let url = URL(string: Path().upcommingMovies)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        set(parameters, urlRequest: &urlRequest)
        setQueryParameters(with: queryParameters, urlRequest: &urlRequest)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> TrendingMoviesModel {
        return try defaultParseResponse(data: data)
    }
}

struct HomePopularMovieAPI: APIHandler {
    func makeRequest(from parameters: [String: Any], queryParameters: [String: String]) -> Request {
        let url = URL(string: Path().popularMovies)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        set(parameters, urlRequest: &urlRequest)
        setQueryParameters(with: queryParameters, urlRequest: &urlRequest)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> TrendingMoviesModel {
        return try defaultParseResponse(data: data)
    }
}

struct HomeTopRatedMovieAPI: APIHandler {
    func makeRequest(from parameters: [String: Any], queryParameters: [String: String]) -> Request {
        let url = URL(string: Path().topRatedMovies)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        set(parameters, urlRequest: &urlRequest)
        setQueryParameters(with: queryParameters, urlRequest: &urlRequest)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())
        return request
    }

    func parseResponse(data: Data) throws -> TrendingMoviesModel {
        return try defaultParseResponse(data: data)
    }
}

