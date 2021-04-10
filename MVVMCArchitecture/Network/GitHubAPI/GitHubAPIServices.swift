//
//  GitHubAPIServices.swift
//  MVVMCArchitecture
//
//  Created by RAirApps on 09/04/21.
//

import Foundation

protocol GitHubAPIServicesProtocol {
    func getUsers(since: Int, completion: @escaping (Result<[User], RequestError>) -> Void)
    func getUsers(since: Int, pageSize: Int, completion: @escaping (Result<[User], RequestError>) -> Void)
}

class GitHubAPIServices: GitHubAPIServicesProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func getUsers(since: Int, completion: @escaping (Result<[User], RequestError>) -> Void) {
        let route = GitHubAPIRoutes.users([.since(since), .perPage(10)])

        request(to: route, parserType: [User].self) { result in
            completion(result)
        }
    }

    func getUsers(since: Int, pageSize: Int, completion: @escaping (Result<[User], RequestError>) -> Void) {
        let route = GitHubAPIRoutes.users([.since(since), .perPage(pageSize)])

        request(to: route, parserType: [User].self) { result in
            completion(result)
        }
    }

    private func request<Data: Codable>(to route: GitHubAPIRoutes, parserType: Data.Type, completion: @escaping (Result<Data, RequestError>) -> Void) {
        guard let url = route.url else {
            completion(.failure(.badURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = route.method

        let task = urlSession.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.underlying(error)))
                }
                return
            }

            if let response = response as? HTTPURLResponse, !response.isSuccessResponse {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed(response.statusCode)))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(.emptyResponse))
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
                    completion(.failure(.underlying(error)))
                }
            }
        }
        task.resume()
    }
}
