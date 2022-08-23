//
//  APILoader.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 22/08/22.
//

import Foundation
class APILoader<T: APIHandler> {

    let apiRequest: T

    let urlSession: URLSession

    let reachibility: Reachability

    init(apiRequest: T, urlSession: URLSession = .shared, reachibility: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachibility = reachibility
    }

    func loadAPIRequest(requestData: T.RequestDataType,
                        queryParameter: [String: String],
                        completionHandler: @escaping (T.ResponseDataType?, Error?) -> ()) {
        // check network status
        if reachibility.connection == .none {
            return completionHandler(nil, NetworkError(message: "No Internet Connection"))
        }

        // prepare url request
        let urlRequest = apiRequest.makeRequest(from: requestData, queryParameters: queryParameter).urlRequest
        // do session task
        print("URL: \(urlRequest.url?.absoluteString ?? "")")
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return completionHandler(nil, error) }
            // parse response
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: data)
                return completionHandler(parsedResponse, nil)
            } catch {
                return completionHandler(nil, error)
            }
        }.resume()
    }
}
