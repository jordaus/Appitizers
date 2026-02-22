//
//  RemoteImage.swift
//  Appitizers
//
//  Created by Jordan Austin on 2/21/26.
//

import SwiftUI
internal import Combine

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(urlString: urlString) { uiImage in
            guard let uIImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uIImage)
            }
            
        }
    }
}

struct RemoteImage: View {
    var image : Image?
    var body : some View {
        image?.resizable() ?? Image(systemName:"food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
    
}
