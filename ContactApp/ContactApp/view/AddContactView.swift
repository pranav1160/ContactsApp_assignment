import SwiftUI

struct AddContactView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(ContactViewModel.self) var cvm
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var mod: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                TextField("Mobile Number", text: $mod)
                    .keyboardType(.phonePad)
            }
            
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        
                        guard !firstName.isEmpty,
                              !lastName.isEmpty,
                              !email.isEmpty,
                              !mod.isEmpty
                        else{
                            return
                        }
                        
                        cvm
                        .addContact(
                                Contact(
                                    id: UUID(),
                                    fname: firstName,
                                    lname: lastName,
                                    email: email,
                                    mod: mod
                                )
                            )
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddContactView()
        .preferredColorScheme(.dark)
}
