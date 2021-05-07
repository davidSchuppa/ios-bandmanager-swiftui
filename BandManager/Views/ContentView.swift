//
//  ContentView.swift
//  BandManager
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        Group {
            if googleDelegate.signedIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    PacklistView()
                        .tabItem {
                            Image(systemName: "checkmark.circle")
                            Text("Packlist")
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
                    SettingsView().environmentObject(googleDelegate)
                        .tabItem {
                            Image(systemName: "gearshape")
                            Text("Settings")
                        }
                }
            } else {
                LoginView()
            }
        }
        .animation(.linear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GoogleDelegate())
    }
}
