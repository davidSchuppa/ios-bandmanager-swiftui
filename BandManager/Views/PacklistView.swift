//
//  ChecklistView.swift
//  BandManager
//

import SwiftUI

struct PacklistView: View {
    @ObservedObject var packlistItemManager = PacklistItemManager()
    @State var showAddItemSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.packlistItemManager.items.indices, id:\.self) { index in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(self.packlistItemManager.items[index].name)
                            Spacer()
                            Button(action: {
                                self.packlistItemManager.items[index].done.toggle()
                                self.packlistItemManager.updateOrder()
                            }) {
                                Image(systemName: self.packlistItemManager.items[index].done ? "checkmark" : "square")
                            }.animation(.default)
                        }
                        Text(self.packlistItemManager.items[index].category)
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
                                    AddItemSheetView(showSheet: $showAddItemSheet, packlistItemManager: self.packlistItemManager)
                                })
        }
    }
    
    
    private func addItem() -> Void {
        self.showAddItemSheet = true
    }
    
    private func onDelete(offsets: IndexSet) {
        self.packlistItemManager.items.remove(atOffsets: offsets)
        }
    
    private func onMove(source: IndexSet, destination: Int) {
        self.packlistItemManager.items.move(fromOffsets: source, toOffset: destination)
    }
}



struct PacklistView_Previews: PreviewProvider {
    static var previews: some View {
        PacklistView()
    }
}
