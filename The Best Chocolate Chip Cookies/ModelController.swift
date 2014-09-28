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

    let stepTitle:NSArray = ["Shopping List", "Prep: Oven", "Prep: Baking Sheets", "Mix Dry Ingredients", "Brown Butter", "Add More Butter", "Add To Butter", "Mix in Eggs", "Mix!", "Add Flour", "Add Chocolate", "Portion Dough", "Apply to Baking Sheets", "Oven Time!", "Rotate!", "Are We Done Yet?", "Tray Two", "All done!"]
    
    let stepDetail:NSArray = ["\nIngredients: \n1 3/4 all-purpose flour \n1/2 tsp baking soda \n14 tbsp unsalted butter \n1/2 cup granulated sugar \n3/4 cup packed dark brown sugar \n1 tsp salt \n2 tsp vanilla extract \n1 egg \n1 egg yolk \n1 1/4 cups chocolate chips\n", "\nPreheat your oven to 375F\n", "\nLine your baking sheets with parchment paper\n", "\nIn a bowl (non-heatproof) mix 1 3/4 cups flour and 1/2 tsp baking soda\n", "\nIn a saucepan over medium-high heat, cook 10 tbsp butter. \nCook until golden, approximately 3 minutes\n", "\nPour the melted butter into the heatproof bowl. \nStir in the remaining 4 tbsp of unmelted butter until melted\n", "\nTo the butter, add sugar and vanilla, whisk until fully mixed\n", "\nAdd egg and yolk, and whisk until smooth\n", "\nLet sit for 30 seconds, then whisk for a minute\n", "\nMix the flour mixture into the butter mixture until just combined\n", "\nStir in chocolate chips\n", "\nDivide the dough into approximately 3 tbsp balls. \nYou should have around 16\n", "\nPut 8 balls of dough onto each prepared baking sheet\n", "\nPut one tray into the oven, bake for 5 minutes\n", "\nRotate the tray in the oven, bake for 5 to 7 minutes more\n", "\nBake until the edges of your cookie are golden brown. \n\nIf they aren't golden brown yet, leave them in for a minute or two longer\n", "\nNow bake the second tray and don't forget to rotate halfway through!\n", "\nApply to face!\n"]
    
    let stepTip:NSArray =  ["TIP: It's fine if you have only one baking sheet. Also, almost all ceramic, glass or metal bowls are sufficiently heatproof", "", "TIP: If you have silicon baking sheets such as Silpats, they work great instead of parchment paper", "", "TIP: Be careful not to burn the butter! If it does look black or smell burnt, start with fresh butter", "", "", "", "", "TIP: Don't over mix your cookies! The more you mix, the more gluten forms in your cookies, the more gluten, the harder & tougher your finished cookies will be", "","", "TIP: Divide the dough into 8 portions. Then take each ball of dough and rip it in half to portion it, no need to reroll it into balls", "TIP: If you chose to try out jagged dough-balls, place them on the pan jagged side up. They bake more evenly this way", "TIP: Rotating makes sure your cookies cook evenly! And don't forget to use oven mitts, the tray will be HOT!", "", "TIP: Overbaked (but not burnt) cookies are still delicious, try them with some ice cream", "TIP: You might want to let the cookies cool on a wire rack. Else you might burn your mouth :("]
    
    var imgArray = [UIImage]()

    override init() {
        super.init()
        // Create the data model.
        for index in 1...18{
            let image = UIImage(named: "\(index).jpg");
            imgArray.append(image)
        }
 
    }

    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.stepTitle.count == 0) || (index >= self.stepTitle.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as DataViewController
        dataViewController.stepTitleObject = self.stepTitle[index] as String
        dataViewController.stepDetailObject = self.stepDetail[index]
        dataViewController.stepTipObject = self.stepTip[index]
        dataViewController.progressObject = Float(index+1.0)/Float(self.stepTitle.count)
        
        dataViewController.imageObject = imgArray[index]
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

