//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 22/08/22.
//

import Foundation

// MARK: - Errors
struct NetworkError: Error {
    let message: String
}

struct UnknownParseError: Error { }

// MARK: - APIHandler
protocol RequestHandler {

    associatedtype RequestDataType

    func makeRequest(from data: RequestDataType) -> Request
}

protocol ResponseHandler {

    associatedtype ResponseDataType

    func parseResponse(data: Data) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler


// MARK: - Request
protocol RequestBuilder {
    func setHeaders(request: inout URLRequest)
}

class DefaultRequest: RequestBuilder {

    func setHeaders(request: inout URLRequest) {
        // header params
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}

class AuthRequest: DefaultRequest {
    override func setHeaders(request: inout URLRequest) {

        super.setHeaders(request: &request)
        // Auth Headers
        let token = SharedData.shared().token!
        request.setValue(token, forHTTPHeaderField: "AuthToken")
        print(token)
    }
}

class Request {

    private var request: URLRequest

    init(urlRequest: URLRequest, requestBuilder: RequestBuilder) {
        self.request = urlRequest
        // do configuration
        requestBuilder.setHeaders(request: &self.request)
    }

    var urlRequest: URLRequest {
        return request
    }
}


// MARK: -
extension RequestHandler {

    /// prepares httpbody
    func set(_ parameters: [String: Any], urlRequest: inout URLRequest) {
        // http body
        if parameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
    }
}


// MARK: - Response
protocol Response: Codable {
    
}

extension ResponseHandler {
    /// generic response data parser
    func defaultParseResponse<T: Response>(data: Data) throws -> T {

        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        if let body = try? jsonDecoder.decode(T.self, from: data) {
            return body
        } else if let errorResponse = try? jsonDecoder.decode(ServiceError.self, from: data) {
            throw errorResponse
        } else {
            throw UnknownParseError()
        }
    }
}

struct ServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}
