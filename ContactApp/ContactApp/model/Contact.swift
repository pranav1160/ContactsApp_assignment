//
//  Contact.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//

import Foundation

struct Contact:Identifiable{
    let id:UUID
    let name:String
    let email:String
    let mod:String
    
    var initials: String{
        if let firstChar = name.first{
            return String(firstChar)
        }
        return "N"
    }
}
