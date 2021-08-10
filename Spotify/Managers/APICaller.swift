//
//  APICaller.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    private init(){}
    
    struct Constants {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    enum APIError: Error {
        case failedToGetData
    }
    public func getCurrentUserProfile(completion: @escaping (Result<UserProfile, Error>) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/me"), type: .GET){
            baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    
                    //JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    completion(.success(result))
                }catch{
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
        
    }
    
    public func getNewReleases(completion: @escaping ((Result<NewReleasesResponse, Error>)) -> Void){
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/new-releases?limit=1"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) {data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
            
        }
    }
    public func getFeaturePlaylists(completion: @escaping ((Result<FeaturePlaylistResponse, Error>) -> Void)){
        createRequest(with: URL(string: Constants.baseAPIURL + "/browse/featured-playlists"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) {data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(FeaturePlaylistResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
            
        }
    }
    
    public func getRecommendations(genres: Set<String>, completion: @escaping ((Result<String, Error>) -> Void)){
        let seeds = genres.joined(separator: ",")
        createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations?seed_genres\(seeds)"), type: .GET) { request in
            
            let task = URLSession.shared.dataTask(with: request) {data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(result)
                    //completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
            
        }
    }
    
    public func getRecommendedGenres(completion: @escaping ((Result<RecommendedGenresResponse, Error>) -> Void)){
        createRequest(with: URL(string: Constants.baseAPIURL + "/recommendations/available-genre-seeds"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) {data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
            
        }
    }
    enum HTTPHethod: String {
        case GET
        case POST
    }
    
    private func createRequest(with url:URL?,type: HTTPHethod, completion: @escaping (URLRequest) ->Void) {
        AuthManager.shared.withValidToken{ token in
            guard let apuURL = url else {
                return
            }
            var request = URLRequest(url: apuURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
    }
}
