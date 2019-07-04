// Jonathan Pham
// Intro to iOS Summer 2019
// Project 3

import Foundation

struct user {
    var name = ""
    var username = ""
    var password = ""
    var email = ""
    var phoneNumber = ""
}

class userData {
    var myUser = [user]()
    var displayUser = [String]()
    var inputTracker = [String]()
    
    func addNewUser(name:String, username:String, password:String, email:String, phoneNumber:String) {
        let newUser = user(name: name, username: username, password: password, email: email, phoneNumber: phoneNumber)
        displayUser.append("Name: \(newUser.name)\nUsername: \(newUser.username)\nE-Mail: \(newUser.email)\nPhone Number: \(newUser.phoneNumber)\n")
        myUser.append(newUser)
        inputTracker = []
    }
    
    func validName (name: String) -> String {
        if (name.isEmpty){
            return ("A Name is required")
        }
        else if (name.count) < 3  {
            return "Name must be at least 3 characters" //Must be at least 3 letters
        }
        else {
            inputTracker.append("name")
            return ""
        }
    }
    
    func validUsername (username: String) -> String {
        if (username.isEmpty){
            return ("A Username is required")
        }
        else if (username.count) < 3  {
            return "Username must be at least 3 characters" //Must be at least 3 letters
        }
        else {
            inputTracker.append("username")
            return ""
        }
    }
    
    func validPassword (password: String) -> String {
        if password.count < 7 {
            return "Password must be at least 7 characters" //Must be at least 7 letters
        }
        else {
            inputTracker.append("password")
            return ""
        }
    }
    
    func validEmail (email: String) -> String {
        if email.count < 3 {
            return "E-mail must be at least 3 characters" //Must be at least 3 letters
        }
        else {
            inputTracker.append("email")
            return ""
        }
    }
    
    func validPhoneNumber (phoneNumber: String) -> String {
        if phoneNumber.count < 10 {
            return "Phone Number must be at least 10 numbers" //Must NOT contain non-numeric numbers
        }
        else {
            inputTracker.append("phoneNumber")
            return ""
        }
    }
    func validInputs() -> Bool {
        if inputTracker.contains("name"), inputTracker.contains("username"), inputTracker.contains("password"), inputTracker.contains("email"),inputTracker.contains("phoneNumber") {
            return true
        }
        else {
            return false
        }
    }
}


