//
//  ToDoModel.swift
//  MvvmFirstApp
//
//  Created by Pavan Avvaru on 14/05/24.
//

import Foundation

struct ToDo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

