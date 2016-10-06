//
//  BasePod.swift
//  BasePod
//
//  Created by Nicolas Molina on 8/8/16.
//  Copyright © 2016 BasePod. All rights reserved.
//

import UIKit

public class BasePod: NSObject
{

    public class func helloPod(controller: UIViewController)
    {
        let alert = UIAlertController(title: "BasePod demo class function", message: "Hello Pod", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        controller.presentViewController(alert, animated: true, completion: nil)
    }

}
