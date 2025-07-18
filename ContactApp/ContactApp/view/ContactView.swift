//
//  ContactView.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//

import SwiftUI

struct ContactView: View {
    
    @State private var cvm = ContactViewModel()
    
    @State private var searchText:String = ""
    @State private var showAddContactView =  false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(cvm.searchResults(txt: searchText)) { contact in
                    NavigationLink {
                        EditContactView(contact: contact)
                            .environment(cvm)
                    } label: {
                        ContactCell(contact: contact)
                            
                    }
                    .swipeActions {
                        Button{
                            withAnimation {
                                cvm.delContact(contact)
                            }
                           
                        }label: {
                            Image(systemName: "trash")
                                .tint(.red)
                        }
                    }
                }
             
            }
            
            .navigationTitle("Contacts")
            .searchable(text: $searchText, prompt: "Search")
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
                    .environment(cvm)
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

