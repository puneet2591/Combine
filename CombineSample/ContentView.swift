//
//  ContentView.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 18/02/26.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
        
    var body: some View {
        
        MainTabView()
    }
}


struct CombineAsyncImageView: View {
    
    private let image: String?
    
    init(image: String?) {
        self.image = image
    }
    
    var body: some View {
        Group {
            KFImage(URL(string: image!))
                .placeholder({
                    Image("no-image")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                })
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
//            AsyncImage(url: URL(string: image!)) { phase in
//                if let image = phase.image {
//                    // Displays the downloaded image
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                } else if phase.error != nil {
//                    // Displays a system icon on error
//                    Image("no-image")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                } else {
//                    // Displays a progress view while loading
//                    BouncingDotsLoader()
//                }
//            }
        }
    }
}


struct BouncingDotsLoader: View {
    @State private var scale: [CGFloat] = [0.5, 0.5, 0.5]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<3) { i in
                Circle()
                    .fill(Color.blue)
                    .frame(width: 15, height: 15)
                    .scaleEffect(scale[i])
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever()
                            .delay(Double(i) * 0.2),
                        value: scale[i]
                    )
            }
        }
        .onAppear {
            for i in 0..<3 {
                scale[i] = 1.0
            }
        }
    }
}


struct DetailView: View {
    
    @State private var viewModel = DetailViewModel()
    
    var body: some View {
        NavigationView {
            Text("Hello, World!")
            .onAppear { 
                print("Detail view on appear called")
            }
            .onDisappear { 
                print("Detail view on disappear called")
            }
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.getAnimals()
        }
    }
}


#Preview {
    //DetailView()
    ContentView()
}
