//
//  Auth.swift
//  Spotify
//
//  Created by 서혁규 on 2021/08/03.
//

import Foundation

final class AuthManager{
    static let shared = AuthManager()
    
    private init(){
        
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
}
