//
//  ViewController.swift
//  Address Book Access
//
//  Created by Philippe petit on 08/01/2016.
//  Copyright © 2016 Philippe petit. All rights reserved.
//
//  Voir: stackoverflow.com/questions/2521183999 tout en bas
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    let peoplePicker = CNContactPickerViewController()
    //var addressBook: ABAddressBookRef?

    // MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        peoplePicker.delegate = self
        //people.displayedProperties = [NSNumber(int: kABPersonEmailProperty)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPicker(sender: UIButton) {
        print("In showPicker")
        //let picker = ABPeoplePickerNavigationController()
        //picker.peoplePickerDelegate = self
        self.presentViewController(peoplePicker, animated: true, completion: nil)
    }
    
    func contactPickerDidCancel(picker: CNContactPickerViewController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact person: CNContact) {
        print("In didSelectContact")
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let phone = person.phoneNumbers[0].value as? CNPhoneNumber
        print("countryCode = \(phone!.valueForKey("countryCode")!)")
        print("digits = \(phone!.valueForKey("digits")!)")
        phoneNumber.text = phone!.stringValue
        
        let personName = person.givenName + " " + person.familyName
        print("personName = \(personName)")
        firstName.text = personName
        
        
    }
    
    func contactPicker(peoplePicker: CNContactPickerViewController, shouldContinueAfterSelectingPerson person: CNContact, property: CNContactProperty) -> Bool {
        print("In shouldContinueAfterSelectingPerson")
        
        contactPicker(peoplePicker, didSelectContact: person)
        
        peoplePicker.dismissViewControllerAnimated(true, completion: nil)
        
        return false
    }
    

}

