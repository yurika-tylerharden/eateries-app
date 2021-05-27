//
//  LazyTextField.swift
//  Eateries
//
//  Created by Tyler Harden on 27/5/21.
//

import SwiftUI

struct LazyTextField: View {
    var prompt: String
    @Binding var text: String
    var onCommit: () -> Void

    var body: some View {
        ActualTextField(prompt: prompt, string: text, text: $text, commit: onCommit)
    }
}

// Keep track of editing mode of actual text fields
// and make sure we don't update if editing
var editingMode = [ String : Bool ]()

struct ActualTextField: View {
    var prompt: String
    @State var string: String
    @Binding var text: String
    var commit: () -> Void

    func updateBinding() {
        text = string
    }

    var body: some View {
        let isEditing = editingMode[prompt]
        let isSetup = isEditing != nil
        if string != text {
            if isEditing == false {
                DispatchQueue.main.async {
                    string = text
                }
            } else if !isSetup {
                editingMode[prompt] = false
            }
        }
        return TextField(prompt, text: $string, onEditingChanged: {
            editingMode[prompt] = $0
            if !$0 { updateBinding() }
        }, onCommit: commit).onDisappear {
            updateBinding()
            editingMode[prompt] = nil
        }
    }
}
