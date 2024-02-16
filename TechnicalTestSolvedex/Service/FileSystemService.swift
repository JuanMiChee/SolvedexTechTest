//
//  FIleSystemService.swift
//  TechnicalTestSolvedex
//
//  Created by Juan Harrington on 14/02/24.
//

import Foundation

class FileSystemService {
  
  let url = URL(string: "https://dog.ceo/api/breed/pug/images/random/1")!
  let session = URLSession.shared
  
  func fetchImagesUrl() async throws -> [String] {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    
    let (data, response) = try await session.data(for: urlRequest)
    let decodeResponse = try JSONDecoder().decode(ImagesModelJson.self, from: data)
    
    return decodeResponse.message
  }
}
