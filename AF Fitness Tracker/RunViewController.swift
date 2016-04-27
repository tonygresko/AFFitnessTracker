//
//  RunViewController.swift
//  AF Fitness Tracker
//
//  Created by Gresko, Anthony (US) on 4/27/16.
//  Copyright © 2016 Tony Gresko. All rights reserved.
//

import UIKit

class RunViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var seconds: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field's user input through delegate callbacks
        minutes.delegate = self
        seconds.delegate = self
        
        checkValidRunTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidRunTime()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    //MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }

    }
    
    func checkValidRunTime() {
        // Disable the Save button if the text field is empty.
        //check if minutes can be casted to int
        
        //check if seconds can be casted to int
        if minutes.text == "00" || seconds.text == "00" {
            //saveButton.enabled = false
        } else{
            saveButton.enabled = true
        }
    }
}