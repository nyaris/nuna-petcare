//
//  TabBarView.swift
//  Nuna
//
//  Created by nana on 01/04/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        DSIcon.home.image
                    }
                }
            
            Text("Task")
                .tabItem {
                    Label {
                        Text("Task")
                    } icon: {
                        DSIcon.task.image
                    }
                }
            
            Text("Shop")
                .tabItem {
                    Label {
                        Text("Shop")
                    } icon: {
                        DSIcon.bag.image
                    }
                }
            
            Text("Social")
                .tabItem {
                    Label {
                        Text("Social")
                    } icon: {
                        DSIcon.users.image
                    }
                }
            
            Text("Profile")
                .tabItem {
                    Label {
                        Text("Profile")
                    } icon: {
                        DSIcon.user.image
                    }
                }
        }.tint(DSColor.Brand.primary)
    }
}

#Preview {
    HomeView()
}
