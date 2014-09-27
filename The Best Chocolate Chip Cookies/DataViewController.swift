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
        if let obj: AnyObject = stepTitleObject {
            self.titleLabel!.text = obj.description
        } else {
            self.titleLabel!.text = ""
        }
        if let obj: AnyObject = stepDetailObject {
            self.stepLabel!.text = obj.description
        } else {
            self.stepLabel!.text = ""
        }

    }


}

