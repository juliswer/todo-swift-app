//
//  ItemModel.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import Foundation

struct ItemModel : Identifiable {
    let id: String = UUID().uuidString
    let title : String
    let isCompleted : Bool
}
