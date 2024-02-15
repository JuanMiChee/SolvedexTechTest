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
        ZStack {
          Color("mainBackgroundColor")
          VStack {
            Text("Pugs")
              .font(.title3)
            VStack(alignment: .leading) {
              ScrollView {
                ForEach(viewModel.viewContent.image, id: \.self) { item in
                  AsyncImage(url: URL(string: item))
                    .scaledToFit()
                }
              }
            }
          }
          
        }
        .padding()
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
