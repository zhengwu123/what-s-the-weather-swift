//
//  ViewController.swift
//  whats the weather
//
//  Created by New on 8/29/15.
//  Copyright (c) 2015 New. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{


   
    @IBOutlet var text1: UITextField!
     @IBOutlet var result: UILabel!
    @IBAction func button(sender: AnyObject) {
        self.text1.delegate = self
    
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + text1.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        
        if url != nil {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                var weather = ""
                
                if error == nil {
                    
                    var urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding) as NSString!
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray.count > 0 {
                        
                        var weatherArray = urlContentArray[1].componentsSeparatedByString("</span>")
                        
                        weather = weatherArray[0] as! String
                        
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    } else {
                        
                        urlError = true
                        
                    }
                    
                    
                    
                } else {
                    
                    urlError = true
                    
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    if urlError == true {
                        
                        self.showError()
                        
                    } else {
                        
                        self.result.text = weather
                        
                    }
                }
                
            })
            
            task.resume()
            
            
        } else {
            
            showError()
            
        }
        
        
    }
    
    
    
    func showError() {
        
        result.text = "Was not able to find weather for " + text1.text! + ". Please try again"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        text1.resignFirstResponder()
        return true
    }
    

    
    /**
     * Called when the user click on the view (outside the UITextField).
     
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

