//
//  ChecklistView.swift
//  BandManager
//

import SwiftUI

struct PacklistView: View {
    @ObservedObject var packlistViewController = PacklistViewController()
    @State var showAddItemSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.packlistViewController.items.indices, id:\.self) { index in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(self.packlistViewController.items[index].name)
                            Spacer()
                            Button(action: {
                                self.packlistViewController.items[index].done.toggle()
                                self.packlistViewController.updateDoneStatus(index: index)
                            }) {
                                Image(systemName: self.packlistViewController.items[index].done ? "checkmark" : "square")
                            }.animation(.default)
                        }
                        Text(self.packlistViewController.items[index].category)
                            .font(.caption)
                            .foregroundColor(Color(.gray))
                    }
                }
                .onMove(perform: onMove)
                .onDelete(perform: onDelete)
            }
            .animation(.linear)
            .navigationTitle(Text("Packlist"))
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    self.addItem()
                                }) {
                                    Image(systemName: "plus")
                                }.sheet(isPresented: $showAddItemSheet, onDismiss: {
                                    self.showAddItemSheet = false
                                }) {
                                    AddItemSheetView(showSheet: $showAddItemSheet, packlistViewController: self.packlistViewController)
                                })
        }
    }
    
    
    private func addItem() -> Void {
        self.showAddItemSheet = true
    }
    
    private func onDelete(offsets: IndexSet) {
        self.packlistViewController.items.remove(atOffsets: offsets)
        }
    
    private func onMove(source: IndexSet, destination: Int) {
        self.packlistViewController.items.move(fromOffsets: source, toOffset: destination)
    }
}



struct PacklistView_Previews: PreviewProvider {
    static var previews: some View {
        PacklistView()
    }
}