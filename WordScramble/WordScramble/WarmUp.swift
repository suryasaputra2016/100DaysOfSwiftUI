//
//  WarmUp.swift
//  WordScramble
//
//  Created by Asti Widiyaningsih on 13/09/22.
//

import SwiftUI

struct WarmUp: View {
    static let input = "a b c"
    static let letters = input.components(separatedBy: " ")
    // we can replacae " " by other elements such as "\n"
    static let letter = letters.randomElement() //optional random element in letters
    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    func spellCheck()-> Bool {
        // UI checker comes from UIKit, and use objc
        let word = "swift"
        let checker = UITextChecker()
        
        // since it's objc, we need to get the length of the characters
        let range = NSRange(location: 0, length: word.utf16.count)
        
        // check any misspelling, report if any is found
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        //check if misspelledRange is empty
        return misspelledRange.location == NSNotFound
    }
    
    let people = ["Adam", "Ben", "Charlie", "Don"]
    
    func openBundle() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt")
        {
            //
            if let fileContents = try? String(contentsOf: fileURL) {
                //
            }
        }

        
    }
    var body: some View {
        VStack {
            List {
                Text("static row 1")
                Text("static row 2")
                
                ForEach(1..<5) {
                    Text("Dynamic row \($0)")
                }
                     
                Text("static row 3")
            }
            
            List {
                Section {
                    Text("static row")
                    Text("Static row 2")
                }
                
                Section {
                    ForEach(1..<3) {
                        Text("Dynamic row \($0)")
                    }
                }
            }
            .listStyle(.grouped)
            
            List(people, id: \.self) {
                Text("Dynamic row \($0)")
            }
        }
    }
}

struct WarmUp_Previews: PreviewProvider {
    static var previews: some View {
        WarmUp()
    }
}
