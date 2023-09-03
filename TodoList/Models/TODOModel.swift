//
//  ItemModel.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import Foundation

struct TODOModel : Identifiable, Codable {
    let id: String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TODOModel {
        return TODOModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
