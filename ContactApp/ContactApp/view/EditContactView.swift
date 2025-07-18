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
    @State private var showDeleteConfirmation = false
    @State private var showCancelConfirmation = false
    let cancelAlertTitle = "Are you sure you wanna exit before saving"
    
    let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        originalContact = contact
    }
    
    @Environment(\.dismiss) private var dismiss
    
    var contactDidChange:Bool{
        originalContact != contact
    }
    
    var body: some View {
        VStack {
            Form {
                Section("Personal Information") {
                    TextField("Enter First Name", text: $contact.fname)
                        .accessibilityLabel("First Name")
                    
                    TextField("Enter Last Name", text: $contact.lname)
                        .accessibilityLabel("Last Name")
                }
                
                Section("Contact Information") {
                    TextField("Enter Email", text: $contact.email)
                        .keyboardType(.emailAddress)
                        .accessibilityLabel("Email Address")
                    
                    TextField("Enter Mobile Number", text: $contact.mod)
                        .keyboardType(.phonePad)
                        .accessibilityLabel("Mobile Number")
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            Spacer()
            
            Button {
                showDeleteConfirmation = true
            } label: {
                Text("Delete Contact")
                    .frame(width: 350, height: 40)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .confirmationDialog(
                "Delete Contact",
                isPresented: $showDeleteConfirmation,
                titleVisibility: .visible
            ) {
                Button("Delete", role: .destructive) {
                    cvm.delContact(contact)
                    dismiss()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure you want to delete this contact? This action cannot be undone.")
            }
        }
        
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    if contactDidChange{
                        showCancelConfirmation = true
                    }else{
                        dismiss()
                    }
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    cvm.updateContact(contact)
                    dismiss()
                }
                .disabled(!contactDidChange)
            }
        }
        .alert("Quiting before Saving?", isPresented: $showCancelConfirmation) {
            Button(role: .destructive){
                dismiss()
            }label: {
                Text("Discard Changes")
            }
        }message: {
            Text(cancelAlertTitle)
                .font(.caption)
        }
    }
    
    // Helper computed properties for validation
    private var isValidEmail: Bool {
        contact.email.contains("@") && contact.email.contains(".")
    }
    
    private var isValidPhone: Bool {
        !contact.mod.isEmpty && contact.mod.allSatisfy { $0.isNumber }
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
        .environment(ContactViewModel())
    }
    .preferredColorScheme(.dark)
}
