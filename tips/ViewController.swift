//
//  ViewController.swift
//  tips
//
//  Created by Rebecca Goldman on 3/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var numberOfPeopleField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipButton: UIButton!
    
    @IBOutlet weak var tipView: UIView!
    
    @IBOutlet weak var totalView: UIView!
    
    @IBOutlet weak var billFieldLabel: UILabel!
    
    @IBOutlet weak var totalFieldLabel: UILabel!
    
    
// this block runs when the screen first loads 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tipButton.titleLabel!.font = UIFont(name: "DIN", size: 14)
        billFieldLabel.font = UIFont(name: "DIN", size: 14)
        totalFieldLabel.font = UIFont(name: "DIN", size: 14)
        numberOfPeopleField.font = UIFont(name: "DIN", size: 40)
        
        tipControl.alpha = 0
        tipView.alpha = 0
        totalView.alpha = 0
        
        billField.becomeFirstResponder()
        
    }

// toggle segmented control visibility & selected state of button
    @IBAction func tipButtonToggle(sender: UIButton) {
        
        
        if tipControl.alpha == 1 {
            
            tipButton.selected = false
            tipControl.alpha = 0.01
            
        } else {
            
            tipButton.selected = true
            tipControl.alpha = 1
        }
        
    }

    
// Animate visibility of tip & total views
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        UIView.animateWithDuration(0.24, animations: {
           
            self.tipView.alpha = 1
            self.totalView.alpha = 1

        })
        
        
        var billString = billField.text
        
        if(countElements(billString) > 0) {
            
            // text added to the field starts after $
            if(billString.substringToIndex(advance(billString.startIndex, 1)) == "$")
            {
                billString = billString.substringFromIndex(advance(billString.startIndex,1))
                
            }
            
        }
        
        
        let tipPercentages = [0.15, 0.2, 0.25]
        
        // update button label based on selected tip percentage
        let tipButtonLabel = Int(tipPercentages[tipControl.selectedSegmentIndex] * 100)
        
        tipButton.setTitle("\(tipButtonLabel)% " + "TIP", forState: UIControlState.Normal)
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billString).doubleValue
        
        let numberOfPeople = numberOfPeopleField.text.toInt()
        
        
        let tip = (billAmount * tipPercentage) / Double(numberOfPeople ?? 1)
        
        let total = (billAmount + tip) / Double(numberOfPeople ?? 1)
        
        billField.text = "$"+"\(billString)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        // view.endEditing(true)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

