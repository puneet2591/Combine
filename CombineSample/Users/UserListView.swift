//
//  UserListView.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import SwiftUI

struct UserListView: View {
    
    @State var viewModel = UserListViewModel(networkService: UserFactory.createUserFactory())
    
    var body: some View {
        NavigationView {
            
            switch viewModel.state {
            case .Idle:
                Text("Screen is Idle")
            case .Loading:
                BouncingDotsLoader()
            case .Success(let users):
                List(users, id: \.id) { user in
                    NavigationLink { 
                        UserDetailView(user: .constant(user))
                    } label: { 
                        VStack(alignment: .leading, spacing: 5) {
                            Text(user.name)
                                .font(.headline)
                        }
                    }
                    
                }
                .navigationTitle("Users")
            case .Failure(let error):
                Text("Error occured: \(error.localizedDescription)")
            }
            
        }
        .task {
            viewModel.getUsers()
        }
    }
}

#Preview {
    UserListView()
}
