//
//  ListViewModel.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var todos : [TODOModel] = [] {
        didSet {
            saveTodos()
        }
    }
    let todosKey: String = "todos_list"
    init() {
        getTodos()
    }
    
    func getTodos() {
        guard
            let data = UserDefaults.standard.data(forKey: todosKey),
            let savedItems = try? JSONDecoder().decode([TODOModel].self, from: data)
        else { return }
        
        self.todos = savedItems
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
    
    func saveTodos() {
        if let encodedData = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encodedData, forKey: todosKey)
        }
    }
}
