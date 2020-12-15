//
//  ChecklistView.swift
//  BandManager
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var checklistItemManager = ChecklistItemManager()
    @State var showAddItemSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.checklistItemManager.items.indices, id:\.self) { index in
                    HStack {
                        Text(self.checklistItemManager.items[index].name)
                        Spacer()
                        Button(action: {
                            self.checklistItemManager.items[index].done.toggle()
                            self.checklistItemManager.updateOrder()
                        }) {
                            Image(systemName: self.checklistItemManager.items[index].done ? "checkmark" : "square")
                        }.animation(.default)
                    }
                }.onMove(perform: { indices, newOffset in
                    self.checklistItemManager.items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle(Text("Packlist"))
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    self.addItem()
                                }) {
                                    Image(systemName: "plus")
                                }.sheet(isPresented: $showAddItemSheet, onDismiss: {
                                    self.showAddItemSheet = false
                                }) {
                                    AddItemSheetView(showSheet: $showAddItemSheet, checklistItemManager: self.checklistItemManager)
                                })
            
        }
    }
    
    
    func addItem() -> Void {
        self.showAddItemSheet = true
    }
}



struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
