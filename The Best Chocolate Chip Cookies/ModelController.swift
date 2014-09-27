//
//  ModelController.swift
//  The Best Chocolate Chip Cookies
//
//  Created by Shamiq Islam on 9/27/14.
//  Copyright (c) 2014 MoogleCookers. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {

//   let stepTitle:NSArray = ["I'm as proud of what we don't do as I am of what we do - Steve Jobs", "That's one small step for man, one giant leap for mankind - Neil Armstrong","An ant on the move does more than a dozing ox - Lao Tzu","I mean, it's impossible But that's exactly what we've tried to do - Jonathan Ive"]

    let stepTitle:NSArray = ["Ingredients & Tools:", "Preheat The Oven", "Prepare Your Baking Sheets", "Mix Dry Ingredients", "Brown the Butter", "Melt Remaining Butter", "Transfer Butter", "Blah"]

    let stepDetail:NSArray = ["flour, sugar, cookie magic", "Preheat the Oven to 375F", "Line your baking sheets with parchment paper or a something", "melt butter in skillet until 2 minutes", "5", "6", "7", "8"]

    override init() {
        super.init()
        // Create the data model.
 
    }

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.stepTitle.count == 0) || (index >= self.stepTitle.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as DataViewController
        dataViewController.stepTitleObject = self.stepTitle[index]
        dataViewController.stepDetailObject = self.stepDetail[index]
        return dataViewController
    }

    func indexOfViewController(viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        if let stepTitleObject: AnyObject = viewController.stepTitleObject {
            return self.stepTitle.indexOfObject(stepTitleObject)
        } else {
            return NSNotFound
        }
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.stepTitle.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}

