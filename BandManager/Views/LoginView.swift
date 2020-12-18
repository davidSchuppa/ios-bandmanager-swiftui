//
//  LoginView.swift
//  BandManager
//
//  Created by David Schuppa on 2020. 12. 18..
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
            GoogleSignInButton()
                .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
