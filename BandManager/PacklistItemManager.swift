//
//  ChecklistItemManager.swift
//  BandManager
//

import Foundation
import SwiftUI

class PacklistItemManager: ObservableObject {
    @Published var items: [PacklistItem] = [
        PacklistItem(name: "Telecaster", category: "guitar"),
        PacklistItem(name: "Dingwall", category: "bass"),
        PacklistItem(name: "Toms", category: "drum", done: true)
    ] 
    
    func updateOrder() {
        items.sort(by: { (item1, item2) -> Bool in
            return !item1.done
        })
    }
    
    func addItem(newItem: PacklistItem) {
        items.append(newItem)
        self.updateOrder()
    }
}
