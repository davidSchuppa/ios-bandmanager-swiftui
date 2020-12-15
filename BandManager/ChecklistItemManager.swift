//
//  ChecklistItemManager.swift
//  BandManager
//

import Foundation
import SwiftUI

class ChecklistItemManager: ObservableObject {
    @Published var items: [ChecklistItem] = [
        ChecklistItem(name: "Guitar"),
        ChecklistItem(name: "Bass"),
        ChecklistItem(name: "Drum", done: true)
    ] 
    
    func updateOrder() {
        items.sort(by: { (item1, item2) -> Bool in
            return !item1.done
        })
    }
}
