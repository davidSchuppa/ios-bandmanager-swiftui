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
                }.onMove(perform: { indices, newOffset in
                    self.packlistItemManager.items.move(fromOffsets: indices, toOffset: newOffset)
                })
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
    
    
    func addItem() -> Void {
        self.showAddItemSheet = true
    }
}



struct PacklistView_Previews: PreviewProvider {
    static var previews: some View {
        PacklistView()
    }
}
