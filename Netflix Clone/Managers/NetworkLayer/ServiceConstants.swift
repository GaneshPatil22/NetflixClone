//
//  ServiceConstants.swift
//  Netflix Clone
//
//  Created by Patil, Ganesh on 22/08/22.
//

import Foundation

enum Environment {

    case development
    case staging
    case production

    func baseURL() -> String {
        return "\(urlProtocol())://\(subdomain()).\(domain())\(route())"
    }

    func queryParamter() -> String {
        return "?api_key=3095bdc20178d76df9839c0dc81c33ec"
    }

    func urlProtocol() -> String {
        switch self {
        case .production:
            return "http"
        default:
            return "http"
        }
    }

    func domain() -> String {
        switch self {
        case .development, .staging, .production:
            return "org"
        }
    }

    func subdomain() -> String {
        switch self {
        case .development, .staging, .production:
            return "api.themoviedb"
        }
    }

    func route() -> String {
        return "/3"
    }

}

extension Environment {
    func host() -> String {
        return "\(self.subdomain()).\(self.domain())"
    }
}


// MARK:- APIs
#if DEBUG
let environment: Environment = Environment.development
#else
let environment: Environment = Environment.staging
#endif

let baseUrl = environment.baseURL()

struct Path {

    var trendingMovies: String { return "\(baseUrl)/trending/movie/day"}
    var trendingTVShows: String { return "\(baseUrl)/trending/tv/day"}
    var upcommingMovies: String { return "\(baseUrl)/movie/upcoming"}
    var popularMovies: String { return "\(baseUrl)/movie/popular"}
    var topRatedMovies: String { return "\(baseUrl)/movie/top_rated"}
    var discoverMovies: String { return "\(baseUrl)/discover/movie"}

//    var registration: String { return "\(baseUrl)/registration" }
//
//    var login: String { return "\(baseUrl)/login" }
//
//    var forgotPassword: String { return "\(baseUrl)/forgotPassword" }
//
//    var logout: String { return "\(baseUrl)/logout" }
//
//    struct User {
//
//        var getProfile: String { return "\(baseUrl)/profile" }
//
//        var deleteUser: (Int) -> String = { userID in
//            return "\(baseUrl)/profile/\(String(userID))"
//        }
//
//        struct Task {
//
//            var getTasks: String { return "\(baseUrl)/tasks" }
//
//            var getTaskDetail: (Int, Int) -> String = { userID, taskID in
//                return "\(baseUrl)/profile/\(String(userID))/task/\(String(taskID))"
//            }
//
//        }
//    }
}
