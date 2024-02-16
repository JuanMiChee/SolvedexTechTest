//
//  MainImagesView.swift
//  TechnicalTestSolvedex
//
//  Created by Juan Harrington on 14/02/24.
//

import SwiftUI

extension MainImagesView {
  static func build() -> Self {
    let service = FileSystemService()
    return MainImagesView(viewModel: .init(dependencies: .init(fetchImage: GetImagesUseCase(service: service))))
  }
}

struct MainImagesView: View {
  @StateObject var viewModel: MainImagesViewModel
  
  var body: some View {
      VStack {
        Text("Pugs")
          .font(.title3)
        List {
          
            ForEach(viewModel.viewContent.images, id: \.self) { item in
              VStack(alignment: .leading) {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                  .resizable()
                  .frame(width: 30, height: 26)
                  .onTapGesture {
                    viewModel.handleTap(item: item)
                  }
                Text("\(item.amountOfLikes)Likes")
                AsyncImage(url: URL(string: item.image)) { phase in
                  if let image = phase.image {
                    image
                      .resizable()
                      .scaledToFit()
                      .padding(.bottom)
                  } else if phase.error != nil {
                    Text("")
                  } else {
                    Color.gray
                      .frame(height: 350)
                  }
                }
            }
              .task {
                if item == viewModel.viewContent.images.last {
                  Task {await viewModel.getImage()}
                }
              }
          }
        }
      }
    .onAppear {
      Task {
        await viewModel.getImage()
      }
    }
  }
}

#Preview {
  MainImagesView.build()
}
