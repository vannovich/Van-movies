//
//  ApiConfig.swift
//  BlossomMovie
//
//  Created by USER on 28/09/2026.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    let youtubeBaseURL: String
    let youtubeAPIKey: String
    let youtubeSearchURL: String
    
    static let shared: APIConfig? = {
        do {
            return try loadConfig()
        }catch{
            print("Failed to load API config: \(error.localizedDescription)")
            return nil
        }
    }()
    
    private static func loadConfig() throws -> APIConfig {
        guard let URL = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else{
            throw APIConfigError.fileNotFound
        }
        do{
            let data = try Data(contentsOf: URL)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }catch let error as DecodingError{
            throw APIConfigError.decodingFailed(underlyingError: error)
        }catch{
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
    }
}
