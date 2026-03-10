//
//  MainTabView.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            AnimalListView()
                .tabItem {
                    Label("Animals", systemImage: "house.fill")
                }
                .tag(0)
            
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person.2.fill")
                }
                .tag(1)
            
//            AnimalListView()
//                .tabItem {
//                    Label("Animals", systemImage: "gearshape.fill")
//                }
//                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
