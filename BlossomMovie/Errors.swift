//
//  Errors.swift
//  BlossomMovie
//
//  Created by USER on 28/09/2026.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
            case .fileNotFound:
            return "API configuration file not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load API configuration data: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode API configuration: \(error.localizedDescription)"
        }
    }
}


enum NetworkError: Error, LocalizedError{
    case baduRLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .baduRLResponse(underlyingError: let error):
            return "Failed to get URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "API configuration is missing"
        case .urlBuildFailed:
            return "Failed to build URL"
        }
    }
    
}
