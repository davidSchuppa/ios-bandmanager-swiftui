//
//  AddItemSheetView.swift
//  BandManager
//
//  Created by David Schuppa on 2020. 12. 09..
//

import SwiftUI

struct AddItemSheetView: View {
    @Binding var showSheet: Bool
    @ObservedObject var checklistItemManager: ChecklistItemManager
    @State private var itemName: String = ""
    @State private var selectedCategory = 0
    @State private var categories = ["guitar", "bass", "vocal"]
    
    var body: some View {
        
        NavigationView {
            Form {
                Text("Item name:")
                TextField("", text: $itemName).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(0..<self.categories.count) { index in
                        Text(self.categories[index])
                    }
                }
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { 
                        Text("Add")
                    }
                }
            }
            .navigationTitle("Add new item")
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.cancelButtonClicked()
                                    }) {
                                        Text("Cancel")
                                    })
        }
    }
    
    func cancelButtonClicked() {
        self.selectedCategory = 0
        self.itemName = ""
        self.showSheet = false
    }
}

struct AddItemSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSheetView(showSheet: .constant(true), checklistItemManager: ChecklistItemManager())
    }
}
