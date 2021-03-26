//
//  AddItemSheetView.swift
//  BandManager
//

import SwiftUI

struct AddItemSheetView: View {
    @Binding var showSheet: Bool
    @ObservedObject var packlistViewController: PacklistViewController
    @State private var itemName: String = ""
    @State private var pickedCategory = ""
    @State private var presentPicker = false
    @State private var selectedCategory = 0
    @State private var showItemNameError = false
    
    
    @State private var categoryText = "other"
    
    var body: some View {
        ZStack {
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
                    
                    HStack {
                        TextField("Category", text: $pickedCategory)
                            .disabled(true)
                            .overlay(
                                Button(action: {
                                    withAnimation {
                                        presentPicker = true
                                    }
                                }) {
                                    Rectangle().foregroundColor(Color.clear)
                                }
                            )
                        
                        Spacer()
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
            if presentPicker {
                CustomPickerView(items: packlistViewController.categories,
                                 pickerField: $pickedCategory,
                                 presentPicker: $presentPicker) { (newCategory) in
                    packlistViewController.categories.append(newCategory)
                }
            }
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
            let newItem = PacklistItem(name: self.itemName, category: pickedCategory)
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
