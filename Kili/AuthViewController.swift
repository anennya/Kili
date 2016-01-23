//
//  ViewController.swift
//  Kili
//
//  Created by Anennya Veeraraghavan on 1/18/16.
//  Copyright © 2016 Anennya Veeraraghavan. All rights reserved.
//

import UIKit
import TwitterKit


class AuthViewController: UIViewController {
    
   
    
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func navigateToMainAppScreen() {
        performSegueWithIdentifier("TextToSpeechWindow", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signIn(sender: UIButton) {
        Twitter.sharedInstance().logInWithCompletion { session, error in
            if session != nil {
                // Navigate to the main app screen to select a theme.
                self.navigateToMainAppScreen()
                
                
            }
        }
    }
    
       
}

