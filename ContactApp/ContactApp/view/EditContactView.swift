//
//  EditContactView.swift
//  ContactApp
//
//  Created by Pranav on 15/07/25.
//

import SwiftUI

struct EditContactView: View {
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Name: \(contact.name)")
            Text("Email: \(contact.email)")
            Text("Mobile: \(contact.mod)")
        }
        .padding()
        .navigationTitle("Contact Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EditContactView(contact: Contact(id: UUID(), name: "Netero The GOAT", email: "iamwhimsical@gmail.com", mod: "123456789"))
    }
    .preferredColorScheme(.dark)
}
