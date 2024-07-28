//
//  URLImageView.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/28.
//

import Foundation
import SwiftUI

struct URLImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: String?

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.loadImage(from: url)
        }
    }
}
