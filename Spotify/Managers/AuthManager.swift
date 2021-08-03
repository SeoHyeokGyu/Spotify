//
//  Auth.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

final class AuthManager{
    static let shared = AuthManager()
    
    struct Contents {
        static let clientID = "ccaed1b058fd4411be2cc907535a8369"
        static let clientSecret = "7904ad7922f745e5ac14097b8eaf5be8"
    }
    
    private init(){}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.naver.com"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Contents.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String?{
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date?{
        return nil
    }
    
    private var shouldRefreshToken: Bool{
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool)-> Void)
    ){
    
    }
    public func refreshAccessToken(){
        
    }
    private func cacheToken(){
        
    }
}
