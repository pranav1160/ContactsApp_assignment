//
//  ContactView.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//

import SwiftUI

struct ContactView: View {
    @State private var demoContacts = [
        Contact(id: UUID(), name: "Monkey D Luffy", email: "pranav1160@gmail.com", mod: "9798700731"),
        Contact(id: UUID(), name: "Roronoa Zoro", email: "zoro@onepiece.com", mod: "9876543210"),
        Contact(id: UUID(), name: "Nami", email: "nami@navigation.com", mod: "9123456789"),
        Contact(id: UUID(), name: "Sanji Vinsmoke", email: "sanji@cookmail.com", mod: "9001122334"),
        Contact(id: UUID(), name: "Tony Tony Chopper", email: "chopper@medical.jp", mod: "9812345670"),
        Contact(id: UUID(), name: "Nico Robin", email: "robin@poneglyph.org", mod: "9977886655")
    ]
    
    @State private var searchText:String = ""
    @State private var showAddContactView =  false
    
    private var filteredContact:[Contact]{
        if searchText.isEmpty{
            return demoContacts
        }
        
        return demoContacts.filter { contact in
            
            contact.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(filteredContact) { contact in
                    NavigationLink {
                        EditContactView(contact: contact)
                    } label: {
                        ContactCell(contact: contact)
                    }

                    
                }
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText, prompt: "Search")
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
                    .presentationDetents([.fraction(0.35)])
                    .presentationDragIndicator(.visible) // or .hidden

            }
            
            .toolbar {
                ToolbarItem {
                    Button{
                        showAddContactView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
       
    }
}

#Preview {
    ContactView()
        .preferredColorScheme(.dark)
}

