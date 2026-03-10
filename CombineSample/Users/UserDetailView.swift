//
//  UserDetailView.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import SwiftUI

struct UserDetailView: View {
    
    @Binding var user: User
    
    var body: some View {
        NavigationView { 
            VStack(alignment: .leading) {
                Text(user.email)
                    .font(.title)
                Spacer()
            }
            .navigationTitle("User Detail")
        }
    }
}

#Preview {
    UserDetailView(user: .constant(User(id: 1, name: "Puneet", email: "puneet@gmail.com")))
}
