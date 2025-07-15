//
//  ContactCell.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//
import SwiftUI

struct ContactCell: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Text(contact.initials)
                .font(.title)
                .frame(width: 48, height: 48)
                .background(.gray)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("\(contact.fname) \(contact.lname)")
                    .font(.headline)
                
                HStack {
                    Text("☏")
                    Text(contact.mod)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .padding(.horizontal, 10)
            
            Spacer()
        }
    }
}


#Preview {
    ContactCell(
        contact: Contact(
            id: UUID(),
            fname: "Netero",
            lname: "The GOAT",
            email: "iamwhimsical@gmail.com",
            mod: "123456789"
        )
    )
        .preferredColorScheme(.dark)
}
