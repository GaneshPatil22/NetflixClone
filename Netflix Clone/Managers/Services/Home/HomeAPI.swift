//
//  HomeAPI.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 23/08/22.
//

import Foundation

struct HomeAPI: APIHandler {

    func makeRequest(from parameters: [String: Any]) -> Request {
        // prepare url
        let url = URL(string: Path().trendingMovies)
        var urlRequest = URLRequest(url: url!)
        // set http method type
        urlRequest.httpMethod = "GET"
        // set body params
        set(parameters, urlRequest: &urlRequest)
        // prepares request (sets header params, any additional configurations)
        let request = Request(urlRequest: urlRequest, requestBuilder: DefaultRequest())

        return request
    }

    func parseResponse(data: Data) throws -> MovieModel {
        return try defaultParseResponse(data: data)
    }

}
