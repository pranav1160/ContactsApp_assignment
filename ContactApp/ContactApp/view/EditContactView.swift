//
//  EditContactView.swift
//  ContactApp
//
//  Created by Pranav on 15/07/25.
//

import SwiftUI

struct EditContactView: View {
    @State private var contact: Contact
    @Environment(ContactViewModel.self) var cvm
    init(contact: Contact) {
        _contact = State(initialValue: contact)
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter First Name", text: $contact.fname)
                TextField("Enter Last Name", text: $contact.lname)
                
                TextField("Enter Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                
                TextField("Enter Mobile Number", text: $contact.mod)
                    .keyboardType(.phonePad)
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            Spacer()
            
            Button {
                cvm.delContact(contact)
            } label: {
                Text("Delete Contact")
                    .frame(width: 350, height: 40)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            .navigationTitle("Edit Contact")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        cvm.updateContact(contact)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditContactView(
            contact: Contact(
                id: UUID(),
                fname: "Netero ",
                lname: "The GOAT",
                email: "iamwhimsical@gmail.com",
                mod: "123456789"
            )
        )
    }
    .preferredColorScheme(.dark)
}
