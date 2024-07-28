//
//  ImageLoader.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/28.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?

    func loadImage(from url: String?, defaultImage: String = "person.circle.fill") {
        guard let url = url, let thumnailURL = URL(string: url) else {
            image = UIImage(systemName: defaultImage)
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: thumnailURL)
            .map { UIImage(data: $0.data) ?? UIImage(systemName: defaultImage) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }

    deinit {
        cancellable?.cancel()
    }
}
