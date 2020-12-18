//
//  GoogleSignInButton.swift
//  BandManager
//
//  Created by David Schuppa on 2020. 12. 18..
//

import GoogleSignIn
import SwiftUI

struct GoogleSignInButton: UIViewRepresentable {
    func makeUIView(context: Context) -> GIDSignInButton {
        let button = GIDSignInButton()
        // Customize button here
        button.colorScheme = .light
        button.style = .standard
        return button
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
