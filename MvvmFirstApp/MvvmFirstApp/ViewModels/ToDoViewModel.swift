//
//  ToDoViewModel.swift
//  MvvmFirstApp
//
//  Created by Pavan Avvaru on 14/05/24.
//

import Foundation

class ToDoViewModel {
    private var todos: [ToDo] = []

    var numberOfTodos: Int {
        return todos.count
    }

    func todoTitle(at index: Int) -> String {
        return todos[index].title
    }

    func fetchTodos(completion: @escaping (Error?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(error)
                return
            }

            guard let data = data else {
                completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }

            do {
                let todos = try JSONDecoder().decode([ToDo].self, from: data)
                self?.todos = todos
                completion(nil)
            } catch {
                completion(error)
            }
        }.resume()
    }
}
