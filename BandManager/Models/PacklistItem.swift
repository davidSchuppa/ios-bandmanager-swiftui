//
//  ChecklistItem.swift
//  BandManager
//
import Foundation

struct PacklistItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var category: String
    var done: Bool = false
}
