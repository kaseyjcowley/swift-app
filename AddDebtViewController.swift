//
//  AddDebtViewController.swift
//  debt-payoff-swift
//
//  Created by Kasey Cowley on 5/5/16.
//  Copyright © 2016 Kasey Cowley. All rights reserved.
//

import UIKit

class AddDebtViewController: UIViewController, UITextFieldDelegate {

  // MARK: Properties
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var amountTextField: UITextField!
  @IBOutlet weak var paymentTextField: UITextField!
  
  var debt: Debt?
  
  // MARK: Actions
  @IBAction func cancel(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if saveButton === sender {
      debt = Debt(
        name: self.nameTextField.text ?? "",
        amount: Double(self.amountTextField.text!)!,
        balance: Double(self.amountTextField.text!)!,
        payment: Double(self.paymentTextField.text!)!,
        dueDate: 1
      )
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameTextField.delegate = self
    amountTextField.delegate = self
    paymentTextField.delegate = self
    
    saveButton.enabled = self.fieldsAreValid()
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.view.endEditing(true)
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    saveButton.enabled = self.fieldsAreValid()
  }
  
  func fieldsAreValid() -> Bool {
    return (
      !(nameTextField.text?.isEmpty)! &&
      !(amountTextField.text?.isEmpty)! &&
      !(paymentTextField.text?.isEmpty)!
    )
  }
  
}
