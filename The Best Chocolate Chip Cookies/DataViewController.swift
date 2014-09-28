//
//  DataViewController.swift
//  The Best Chocolate Chip Cookies
//
//  Created by Shamiq Islam on 9/27/14.
//  Copyright (c) 2014 MoogleCookers. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var stepTitleObject: AnyObject?
    
    @IBOutlet weak var stepLabel: UILabel!
    var stepDetailObject: AnyObject?
    
    @IBOutlet weak var tipLabel : UILabel!
    var stepTipObject: AnyObject?
    
    @IBOutlet weak var progress : UIProgressView!
    var progressObject: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //Setting Title Text
        if let obj: AnyObject = stepTitleObject {
            self.titleLabel!.text = obj.description

        } else {
            self.titleLabel!.text = ""
        }
        
        //Setting Steps Text
        if let obj: AnyObject = stepDetailObject {
            self.stepLabel!.text = obj.description
            self.stepLabel.layer.masksToBounds = true
            self.stepLabel.layer.cornerRadius = 10
        } else {
            self.stepLabel!.text = ""
        }


        
        //Setting Tip Text
        if let obj: AnyObject = stepTipObject {
            self.tipLabel!.text = obj.description
            self.stepLabel.layer.masksToBounds = true
            self.stepLabel.layer.cornerRadius = 10

            
        } else {
            self.tipLabel!.text = ""
        }
        
        //Setting progress
        if let obj: AnyObject = progressObject{
            self.progress!.progress = obj as Float
        } else {
            self.progress!.progress = 0.0
        }
    }


}

