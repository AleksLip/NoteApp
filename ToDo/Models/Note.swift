//
//  Notes.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 09.09.2022.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: String
    var title: String {
        if noteText.isEmpty {
            return "Your Note"
        }
        else {
            return noteText
        }
    }
    var noteText: String

    init(id:String = UUID().uuidString, title: String, noteText: String) {
        self.id = id
        self.noteText = noteText
    }
    
    func updateNote() -> Note {
        return Note(id: id, title: title, noteText: noteText)
    }

}

