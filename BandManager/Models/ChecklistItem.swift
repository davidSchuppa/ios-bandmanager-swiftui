//
//  ChecklistItem.swift
//  BandManager
//
import Foundation

struct ChecklistItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var done: Bool = false
}
