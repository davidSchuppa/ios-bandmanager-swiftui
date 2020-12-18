//
//  FloatingTextField.swift
//  BandManager
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Color(.placeholderText))
                .offset(y: text.wrappedValue.isEmpty ? 0 : -30)
                .scaleEffect(text.wrappedValue.isEmpty ? 1 : 0.75, anchor: .leading)
                .padding(.horizontal)
                
            TextField("", text: text)
            .autocapitalization(UITextAutocapitalizationType.none)
            .frame(height: 30)
            .padding(.horizontal)
            .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.placeholderText), lineWidth: 1)
                )
            
        }
        .padding(.top, 15)
        .animation(.spring(response: 0.4, dampingFraction: 0.3))
    }
}
struct FloatingTextField_Previews: PreviewProvider {
    @State var text = "text"
    static var previews: some View {
        FloatingTextField(title: "TextField", text: .constant(""))
    }
}
