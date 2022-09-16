//
//  Notes.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 09.09.2022.
//

import Foundation

//class MyNotes: ObservableObject {
//    @Published var notes: [Notes] = [
//        Notes(title: "", noteText: ""),
//        Notes(title: "", noteText: "")
//    ]
//
//}

struct Notes: Identifiable, Codable {
    let id: String
    let title: String
    var noteText: String
    
    init(id:String = UUID().uuidString, title: String, noteText: String) {
        self.id = id
        self.title = title
        self.noteText = noteText
    }
    func updateNote() -> Notes {
        return Notes(id: id, title: title, noteText: noteText)
    }
    
}
