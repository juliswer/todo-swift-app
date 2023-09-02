//
//  ListViewModel.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var todos : [TODOModel] = []
    init() {
        getTodos()
    }
    
    func getTodos() {
        let newTodos = [
            TODOModel(title: "This is the first title!", isCompleted: false),
            TODOModel(title: "This is the second title!", isCompleted: true),
            TODOModel(title: "This is the third title!", isCompleted: false),
        ]
                      
        todos.append(contentsOf: newTodos)
    }
    
    func deleteItem(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to : Int) {
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func todoAlreadyExistsInApp(title: String) -> Bool {
        return todos.contains {$0.title == title}
    }
    
    func addItem(title: String) {
        let newItem = TODOModel(title: title, isCompleted: false)
        todos.append(newItem)
    }
    
    func updateItem(item: TODOModel) {
        if let index = todos.firstIndex(where: { $0.id == item.id }) {
            todos[index] = item.updateCompletion()
        }
    }
}
