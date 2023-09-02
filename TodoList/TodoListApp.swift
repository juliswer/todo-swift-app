//
//  TodoListApp.swift
//  TodoList
//
//  Created by Julian Swerdlin on 02/09/2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView() 
            }
            .environmentObject(listViewModel)
        }
    }
}
