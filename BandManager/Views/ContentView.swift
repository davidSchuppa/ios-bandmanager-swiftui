//
//  ContentView.swift
//  BandManager
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        NavigationView {
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
                    }
                    .navigationBarItems(
                        trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            NavigationLink(destination: SettingsView().environmentObject(googleDelegate)) {
                                Image(systemName: "gearshape")
                            }
                        }
                    )
                } else {
                    LoginView()
                        .navigationBarHidden(true)
                }
            }
            .animation(.linear)
        }.onAppear(perform: {
            print("fuck")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GoogleDelegate())
    }
}
