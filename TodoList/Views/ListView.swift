//
//  ListView.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import SwiftUI

struct ListView: View {
    @State var todos : [TODOModel] = [
        TODOModel(title: "This is the first title!", isCompleted: false),
        TODOModel(title: "This is the second title!", isCompleted: true),
        TODOModel(title: "This is the third title!", isCompleted: false),
    ]
    
    var body: some View {
        List {
            ForEach(todos) {todo in
                ListRowView(todo: todo.self)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


