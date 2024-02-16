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
  @Published var showFetchErrorAlert: Bool = false
  
  func getImages() async {
    do {
      let images = try await dependencies.fetchImage.execute()
      let newResponse = MainImagesViewContent(images: images.map({ item in
        MainImageViewContent(image: item,
                             isLiked: false,
                             amountOfLikes: Int.random(in: 1...100))
        
        
      }))
      viewContent.images.append(contentsOf: newResponse.images)
    } catch {
      showFetchErrorAlert.toggle()
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
  
  func handleLoading(item: MainImageViewContent) {
    if item == viewContent.images.last {
      Task { await getImages() }
    }
  }
}

extension MainImageViewContent {
  var toggled: Self {
    .init(image: image,
          isLiked: isLiked ? false : true,
          amountOfLikes: isLiked ? amountOfLikes - 1 : amountOfLikes + 1)
  }
}
