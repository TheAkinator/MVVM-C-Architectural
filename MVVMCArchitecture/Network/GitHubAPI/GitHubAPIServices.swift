//
//  GitHubAPIServices.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

protocol GitHubAPIServicesProtocol {
    func getUsers(since: Int, completion: @escaping (Result<[User], Error>) -> Void)
    func getUsers(since: Int, pageSize: Int, completion: @escaping (Result<[User], Error>) -> Void)
}

class GitHubAPIServices: GitHubAPIServicesProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func getUsers(since: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let route = GitHubAPIRoutes.users([.since(since), .perPage(10)])

        request(to: route, parserType: [User].self) { result in
            completion(result)
        }
    }

    func getUsers(since: Int, pageSize: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let route = GitHubAPIRoutes.users([.since(since), .perPage(pageSize)])

        request(to: route, parserType: [User].self) { result in
            completion(result)
        }
    }

    private func request<Data: Codable>(to route: GitHubAPIRoutes, parserType: Data.Type, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = route.url else {
            completion(.failure(GitHubAPIError.badURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = route.method

        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let isSuccessResponse = response?.isSuccessResponse, isSuccessResponse else {
                DispatchQueue.main.async {
                    completion(.failure(GitHubAPIError.badResponse))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(GitHubAPIError.noData))
                }
                return
            }

            do {
                let model = try JSONDecoder().decode(parserType.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
