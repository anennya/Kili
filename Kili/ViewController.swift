//
//  ViewController.swift
//  Kili
//
//  Created by Anennya Veeraraghavan on 1/18/16.
//  Copyright © 2016 Anennya Veeraraghavan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func textToSpeech(sender: UIButton) {
        myUtterance = AVSpeechUtterance(string: textview.text)
        myUtterance.rate = 0.5
        synth.speakUtterance(myUtterance)
    }
   
}

