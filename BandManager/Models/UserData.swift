//
//  UserData.swift
//  BandManager
//

import Foundation
import GoogleSignIn

class UserData: NSObject, ObservableObject {
    @Published var googleSignIn: GIDSignIn
    
    init(googleSignIn: GIDSignIn) {
        self.googleSignIn = googleSignIn
    }
}
