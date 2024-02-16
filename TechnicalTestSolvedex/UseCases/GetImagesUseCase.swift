//
//  GetImagesUseCase.swift
//  TechnicalTestSolvedex
//
//  Created by Juan Harrington on 14/02/24.
//

import Foundation

protocol GetImagesUseCaseProtocol {
  func execute() async throws -> [String]
}

struct GetImagesUseCase: GetImagesUseCaseProtocol {
  let service: FileSystemService
  func execute() async throws -> [String] {
    try await service.fetchImagesUrl()
  }
}
