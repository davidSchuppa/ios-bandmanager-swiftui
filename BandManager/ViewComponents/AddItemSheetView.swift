//
//  AddItemSheetView.swift
//  BandManager
//

import SwiftUI

struct AddItemSheetView: View {
    @Binding var showSheet: Bool
    @ObservedObject var packlistViewController: PacklistViewController
    @State private var itemName: String = ""
    @State private var selectedCategory = 0
    @State private var categories = ["other", "guitar", "bass", "vocal"]
    @State private var showItemNameError = false
    
    var body: some View {
        
        NavigationView {
            Form {
                VStack {
                    if(self.showItemNameError) {
                        Text("Please fill out the item name!")
                            .font(.caption)
                            .foregroundColor(Color.red)
                            .animation(.easeIn)
                    }
                    FloatingTextField(title: "Item name", text: $itemName)
                        .onChange(of: itemName, perform: { _ in
                        self.showItemNameError = false
                    })
                }
                
                Spacer()
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(0..<self.categories.count) { index in
                        Text(self.categories[index])
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        self.addNewItem()
                    }) {
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
    
    func addNewItem() {
        if(self.itemName.isEmpty) {
            self.showItemNameError = true
        } else {
            let newItem = PacklistItem(name: self.itemName, category: categories[selectedCategory])
            packlistViewController.addItem(newItem: newItem)
            self.showSheet = false
        }
    }
}

struct AddItemSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSheetView(showSheet: .constant(true), packlistViewController: PacklistViewController())
    }
}
