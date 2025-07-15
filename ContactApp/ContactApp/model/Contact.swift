//
//  Contact.swift
//  ContactApp
//
//  Created by Pranav on 14/07/25.
//

import Foundation

struct Contact:Identifiable{
    let id:UUID
    var fname:String
    var lname:String
    var email:String
    var mod:String
    
    var initials: String{
        if let firstChar = fname.first , let secChar = lname.first {
            return String("\(firstChar)\(secChar)")
        }
        return "NA"
    }
    
    var fullName: String{
        fname+lname
    }
}
