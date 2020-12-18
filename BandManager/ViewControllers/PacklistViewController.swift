//
//  ChecklistItemManager.swift
//  BandManager
//

import Foundation
import SwiftUI
import FirebaseDatabase

class PacklistViewController: ObservableObject {
    let dbRef = Database.database().reference().child("packlist")
    @Published var items: [PacklistItem] = []
    
    init() {
        dbRef.observe(.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                let data = child as! DataSnapshot
                let itemDict = data.value as! [String: Any]
                let itemName = itemDict["name"] as! String
                let category = itemDict["category"] as! String
                let done = (itemDict["done"] as! NSNumber).boolValue
                let packlistItem: PacklistItem = PacklistItem(name: itemName, category: category, done: done)
                self.items.append(packlistItem)
            }
            self.updateOrder()
        }
    }
    
    func updateOrder() {
        items.sort(by: { (item1, item2) -> Bool in
            return !item1.done
        })
    }
    
    func updateDoneStatus(index: Int) {
        let itemToUpdate = items[index]
        dbRef.child(itemToUpdate.name.lowercased()).updateChildValues(["done": itemToUpdate.done])
        self.updateOrder()
    }
    
    func addItem(newItem: PacklistItem) {
        let key = newItem.name.lowercased()
        self.dbRef.child(key).setValue(newItem.dictionary) {
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully!")
            }
        }
        items.append(newItem)
        self.updateOrder()
    }
}
