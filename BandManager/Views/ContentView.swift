//
//  ContentView.swift
//  BandManager
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ChecklistView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Checklist")
                }
            ExpensesView()
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Expenses")
                }
             MembersView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Members")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
