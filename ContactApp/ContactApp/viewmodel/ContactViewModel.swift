//
//  ContactViewModel.swift
//  ContactApp
//
//  Created by Pranav on 16/07/25.
//

import Observation
import Foundation

@Observable class ContactViewModel{
    var allContacts:[Contact] = []
    
    init(){
        allContacts.append(contentsOf: demoContacts)
    }
    
    let demoContacts = [
        Contact(id: UUID(), fname: "Monkey D", lname: "Luffy", email: "pranav1160@gmail.com", mod: "9798700731"),
        Contact(id: UUID(), fname: "Roronoa", lname: "Zoro", email: "zoro@onepiece.com", mod: "9876543210"),
        Contact(id: UUID(), fname: "Nami", lname: "", email: "nami@navigation.com", mod: "9123456789"),
        Contact(id: UUID(), fname: "Sanji", lname: "Vinsmoke", email: "sanji@cookmail.com", mod: "9001122334"),
        Contact(id: UUID(), fname: "Tony Tony", lname: "Chopper", email: "chopper@medical.jp", mod: "9812345670"),
        Contact(id: UUID(), fname: "Nico", lname: "Robin", email: "robin@poneglyph.org", mod: "9977886655")
    ]
    
    func addContact(_ contact:Contact){
        self.allContacts.append(contact)
    }
    
    func delContact(_ contact:Contact){
        
    }
    
    func updateContact(_ contact:Contact){
        
    }
    
}
