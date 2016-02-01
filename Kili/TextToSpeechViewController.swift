//
//  TextToSpeechViewController.swift
//  Kili
//
//  Created by Anennya Veeraraghavan on 1/23/16.
//  Copyright © 2016 Anennya Veeraraghavan. All rights reserved.
//

import UIKit
import AVFoundation
import TwitterKit


class TextToSpeechViewController: UIViewController,TWTRTweetViewDelegate {
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    var tweets: [String] = []
    var tweetIDs = ["266031293945503744", "440322224407314432"]
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Twitter.sharedInstance().logInWithCompletion { session, error in
            // Check we have a valid guest session.
            if session != nil {
                let client = TWTRAPIClient()
                client.loadTweetsWithIDs(self.tweetIDs) { twttrs, error in
                //client.loadUserWithID("@anennya") { twttrs, error in
                    
                    // If there are tweets do something magical
                    if ((twttrs) != nil) {
                        
                        // Loop through tweets and do something
                        for i in twttrs! {
                            let tweet = i as! TWTRTweet
                        
                            self.tweets.append(tweet.text)
                            
                            }
                        
                        for i in self.tweets {
                            print(i)
                        }
                            //print(self.tweets[0].text)
                        }
                     else {
                        print(error)
                    }
                }
                
            }
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func KiliTalking(sender: UIButton) {
        var actualText = ""
       // var toSpeak = ""
        
        for tweet in self.tweets{
            var myArray : [String] = tweet.componentsSeparatedByString("http")
            print(myArray)
            actualText = myArray[0]
            myUtterance = AVSpeechUtterance(string: actualText)
            myUtterance.rate = 0.5
            synth.speakUtterance(myUtterance)

        }
        
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
