//
//  AnimalListView.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import SwiftUI

struct AnimalListView: View {
    
    @State var viewModel = AnimalViewModel(networkService: AnimalFactory.createAnimalFactory())
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .Idle:
                Text("View is Idle")
            case .Loading:
                BouncingDotsLoader()
            case .Success(let animals):
                List(animals, id: \.id) { animal in
                    NavigationLink {
                        DetailView()
                    } label: {
                        HStack {
                            CombineAsyncImageView(image: animal.image)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(.trailing)
                            Text(animal.name)
                                .font(.headline)
                            Spacer()
                        }
                    }

                }
                .navigationTitle("Animals")
            case .Failure(let error):
                Text("Api failed: \(error.localizedDescription)")
            }
        }
        .task {
            viewModel.getAnimals()
        }
        .onAppear { 
            print("List view on appear called")
        }
        .onDisappear { 
            print("List view on disappear called")
        }
    }
}

#Preview {
    AnimalListView()
}
