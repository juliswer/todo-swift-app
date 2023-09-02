//
//  ListRawView.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import SwiftUI

struct ListRowView: View {
    let todo: TODOModel
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = TODOModel(title: "item 1", isCompleted: false)
    static var item2 = TODOModel(title: "item 2", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(todo : item1)
            ListRowView(todo : item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
