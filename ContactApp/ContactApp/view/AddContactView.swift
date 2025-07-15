//
//  AddContactView.swift
//  ContactApp
//
//  Created by Pranav on 15/07/25.
//

import SwiftUI

struct AddContactView: View {
    
    @State private var thisName: String = ""
    @State private var thisEmail: String = ""
    @State private var thisMod: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                CustomTextField(placeholder: "Enter Name", text: $thisName)
                
                CustomTextField(placeholder: "Enter Email", text: $thisEmail)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                CustomTextField(placeholder: "Enter Mobile Number", text: $thisMod)
                    .keyboardType(.phonePad)
                
            
                
            }
            .padding()
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Add contact logic here
                        print("Name: \(thisName), Email: \(thisEmail), Mob: \(thisMod)")
                    }) {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    AddContactView()
        .preferredColorScheme(.dark)
}


struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
