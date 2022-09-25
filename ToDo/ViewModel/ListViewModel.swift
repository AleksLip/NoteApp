//
//  ListViewModel.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 11.09.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var allMyNotes: [Note] = [] {
        
        // Any time allMyNotes is changed, the code below runs
        
        didSet {
            saveAllMyNotes()
        }
    }
    let noteKey: String = "notes_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: noteKey),
            let savedNotes = try? JSONDecoder().decode([Note].self, from: data)
        else { return }
        
        self.allMyNotes = savedNotes
        
//        let newItems = [
//            Notes(title: "Note 1", noteText: ""),
//            Notes(title: "Note 2", noteText: "")
//        ]
//        myNote.append(contentsOf: newItems)
    }
    
    func deleteNote(indexSet: IndexSet) {
        allMyNotes.remove(atOffsets: indexSet)
    }

    func moveNote(from: IndexSet, to: Int) {
        allMyNotes.move(fromOffsets: from, toOffset: to)
    }
    
    func addNote() {
        let newNote = Note(title: "", noteText: "")
        allMyNotes.append(newNote)
    }
    
    func updateNotes(item: Note) {
        
        if let index = allMyNotes.firstIndex(where: { $0.id == item.id}) {
            allMyNotes[index] = item.updateNote()
        }
    }
    
    func saveAllMyNotes() {
        if let encodedData = try? JSONEncoder().encode(allMyNotes) {
            UserDefaults.standard.set(encodedData, forKey: noteKey)
        }
    }
    
}


