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
    
    @IBOutlet weak var tipView: UIView!
    
    @IBOutlet weak var totalView: UIView!
    
    @IBOutlet weak var billFieldLabel: UILabel!
    
    @IBOutlet weak var totalFieldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tipButton.titleLabel!.font = UIFont(name: "DIN", size: 16)
        billFieldLabel.font = UIFont(name: "DIN", size: 14)
        totalFieldLabel.font = UIFont(name: "DIN", size: 14)

        
        tipControl.alpha = 0
        
        tipView.alpha = 0
        totalView.alpha = 0
        
        billField.becomeFirstResponder()
        
    
        self.tipView.frame = CGRect(x: 0, y: 200, width: 320, height: 150)
        
        
        
    }


    
    @IBAction func tipButtonToggle(sender: UIButton) {
        
        
        if tipControl.alpha == 1 {
            
            tipButton.selected = false
            tipControl.alpha = 0

            
        } else {
            
            tipButton.selected = true
            tipControl.alpha = 1

        }
        
        
    }

    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        UIView.animateWithDuration(0.24, animations: {
            self.tipView.alpha = 1
            self.totalView.alpha = 1
            
            
            self.tipView.frame = CGRect(x: 0, y: 150, width: 320, height: 150)
            

        })
        
        var billString = billField.text
        
        if(countElements(billString) > 0) {
            
            if(billString.substringToIndex(advance(billString.startIndex, 1)) == "$") {
                billString = billString.substringFromIndex(advance(billString.startIndex,1))
            }
        }
        
        

        
        var tipPercentages = [0.15, 0.2, 0.25]
        
        let tipButtonLabel = Int(tipPercentages[tipControl.selectedSegmentIndex] * 100)
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billString).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        billField.text = "$"+"\(billString)"

        tipButton.setTitle("\(tipButtonLabel)% " + "tip", forState: UIControlState.Normal)

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

