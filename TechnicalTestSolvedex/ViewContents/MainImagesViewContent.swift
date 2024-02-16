//
//  MainImagesViewContent.swift
//  TechnicalTestSolvedex
//
//  Created by Juan Harrington on 14/02/24.
//

import Foundation

struct MainImagesViewContent {
  var images: [MainImageViewContent]
}

struct MainImageViewContent: Hashable {
  var image: String
  var isFavorite: Bool
  var amountOfLikes: Int
}
