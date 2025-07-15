//
//  ContactCell.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//
import SwiftUI


struct ContactCell:View {
    let contact:Contact
    var body: some View {
        HStack{
            Text("\(contact.initials)")
                .font(.largeTitle)
                .frame(width: 48,height: 48)
                .background(.gray)
                .clipShape(.circle)
            
            VStack(alignment: .leading){
                Text("\(contact.name)")
                HStack{
                    Text("☏")
//                        .font(.title2)
                    Text("\(contact.mod)")
                }
               
            }
            .padding(.horizontal,10)
            
            Spacer()
            
        }
    }
}

#Preview {
    ContactCell(contact: Contact(id: UUID(), name: "Netero The GOAT", email: "iamwhimsical@gmail.com", mod: "123456789"))
        .preferredColorScheme(.dark)
}
