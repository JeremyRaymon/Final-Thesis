//
//  ContentView.swift
//  IColab
//
//  Created by Brandon Nicolas Marlim on 7/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabBar : TabBarType = .home
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    switch selectedTabBar {
                    case .home:
                        HomeView()
                    case .projects:
                        Text("Projects")
                    case .chats:
                        Text("Chats")
                    case .notifications:
                        Text("Notifications")
                    case .profile:
                        Text("Profile")
                    }
                }
                Spacer()
            }
            TabBarView(selectedTabItem: $selectedTabBar)
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
