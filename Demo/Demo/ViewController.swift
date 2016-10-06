//
//  ViewController.swift
//  Demo
//
//  Created by Nicolas Molina on 10/5/16.
//  Copyright © 2016 Base pod. All rights reserved.
//

import UIKit
import BasePod

class ViewController: UIViewController {

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

        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(3 * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            {
                BasePod.helloPod(self)
            }
        )
    }


}

