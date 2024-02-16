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
  
  @Published var viewContent: MainImagesViewContent = .init(images: [])
  let imagesDictionary: [String: Image] = [:]
  
  func getImage() async {
    do {
      let newResponse = MainImagesViewContent(images: try await dependencies.fetchImage.execute().map({ item in
        MainImageViewContent(image: item,
                             isFavorite: false,
                             amountOfLikes: Int.random(in: 1...100))
        
        
      }))
      viewContent.images.append(contentsOf: newResponse.images)
    } catch {
      print(error)
    }
  }
  
  func handleTap(item: MainImageViewContent) {
    viewContent.images = viewContent.images.map { currentItem in
      if item.image == currentItem.image {
        return currentItem.toggled
      } else {
        return currentItem
      }
    }
  }
  
  func isLastItem() async {
    await getImage()
  }
}

extension MainImageViewContent {
  var toggled: Self {
    .init(image: image,
          isFavorite: isFavorite ? false : true,
          amountOfLikes: isFavorite ? amountOfLikes - 1 : amountOfLikes + 1)
  }
}
