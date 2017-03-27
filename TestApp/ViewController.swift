//
//  ViewController.swift
//  TestApp
//
//  Created by gwa on 3/27/17.
//  Copyright © 2017 gwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func click(_ sender: UIButton) {
        performSegue(withIdentifier: "showModalOne", sender: nil)
    }
}

