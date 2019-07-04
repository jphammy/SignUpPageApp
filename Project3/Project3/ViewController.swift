// Jonathan Pham
// Intro to iOS Summer 2019
// Project 3

import Foundation
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let model = userData()
    
    // IBOutlet Section
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailFIeld: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var usersView: UITextView!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        usernameField.delegate = self
        passwordField.delegate = self
        emailFIeld.delegate = self
        phoneNumberField.delegate = self
    }
    
    // IBAction Function
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        model.addNewUser(name: nameField.text!, username: usernameField.text!, password: passwordField.text!, email: emailFIeld.text!, phoneNumber: phoneNumberField.text!)
        usersView.text = model.displayUser.joined(separator: "\n")
        
        nameField.text = ""
        usernameField.text = ""
        passwordField.text = ""
        emailFIeld.text = ""
        phoneNumberField.text = ""
        
        addButtonOutlet.isEnabled = false
    }

    // Functions section
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        inputValidation(textField: textField)
        if model.validInputs() {
            addButtonOutlet.isEnabled = true
        }
        else {
            addButtonOutlet.isEnabled = false
        }
        return true
    }
    
    func inputValidation (textField: UITextField){
        if textField == nameField {
            let validName = model.validName(name: nameField.text!)
            if validName.count > 0 {
                sendAlert(message: validName)
            }
        }
        if textField == usernameField {
            let validUsername = model.validUsername(username: usernameField.text!)
            if validUsername.count > 0 {
                sendAlert(message: validUsername)
            }
        }
        if textField == passwordField {
            let validPassword = model.validPassword(password: passwordField.text!)
            if validPassword.count > 0 {
                sendAlert(message: validPassword)
            }
        }
        if textField == emailFIeld {
            let validEmail = model.validEmail(email: emailFIeld.text!)
            if validEmail.count > 0 {
                sendAlert(message: validEmail)
            }
        }
        if textField == phoneNumberField {
            let validPhoneNumber = model.validPhoneNumber(phoneNumber: phoneNumberField.text!)
            if validPhoneNumber.count > 0 {
                sendAlert(message: validPhoneNumber)
            }
        }
    }
    func sendAlert (message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        
        if let presented = self.presentedViewController {
            presented.removeFromParent()
        }
        
        if presentedViewController == nil {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberField {
            let allowedChars = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedChars.isSuperset(of: characterSet)
        } else {
            return true
        }
        
    }
}
