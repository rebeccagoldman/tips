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
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tipControl.alpha = 0
    }

    
    @IBAction func tipButtonToggle(sender: UIButton) {
        
        if(tipControl.alpha == 1) {
            tipControl.alpha = 0
            println("Tip Control is hidden")
            
        } else {
            
            tipControl.alpha = 1
            println("Tip Control is visible")

            
            
        }
    }

    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var billString = billField.text
        
        if(countElements(billString) > 0) {
            
            if(billString.substringToIndex(advance(billString.startIndex, 1)) == "$") {
                billString = billString.substringFromIndex(advance(billString.startIndex,1))
            }
        }
        
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billString).doubleValue
        
      
        
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        billField.text = "$"+"\(billString)"

        
        var numberOfPeople = 2
        
    
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        

    }
    
    
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

