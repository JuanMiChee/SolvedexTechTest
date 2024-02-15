//
//  MainImagesViewModel.swift
//  TechnicalTestSolvedex
//
//  Created by Juan Harrington on 14/02/24.
//

import Foundation
import SwiftUI

@MainActor final class MainImagesViewModel: ObservableObject {
  
  struct Dependencies {
    let fetchImage: GetImagesUseCaseProtocol
  }
  
  let dependencies: Dependencies
  
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  @Published var viewContent: MainImagesViewContent = .init(image: [])
  
  func getImage() async {
    do {
      viewContent = .init(image: try await dependencies.fetchImage.execute()) 
    } catch {
      print(error)
    }
  }
}
