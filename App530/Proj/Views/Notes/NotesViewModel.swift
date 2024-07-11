//
//  NotesViewModel.swift
//  App530
//
//  Created by IGOR on 05/05/2024.
//

import SwiftUI

final class NotesViewModel: ObservableObject {

    @AppStorage("notes") var notes: [String] = []
    @Published var selectedNote = ""
    @Published var addingNote = ""
    
    @AppStorage("selNote") var selNote: [String] = []
    
    @Published var isAdd: Bool = false

}

