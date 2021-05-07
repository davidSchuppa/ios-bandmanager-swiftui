//
//  SettingsView.swift
//  BandManager
//
//  Created by David Schuppa on 2021. 03. 26..
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var googleDelegate: GoogleDelegate
    
    var body: some View {
        Button(action: {
            googleDelegate.logOut()
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Sign out")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
