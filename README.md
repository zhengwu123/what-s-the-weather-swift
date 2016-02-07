# what-s-the-weather-swift

Learning objective:
// hide textfield keyboard when click return

   func textFieldShouldReturn(textField: UITextField!) -> Bool{
        text1.resignFirstResponder()
        return true
    }
    

    
  // hide keyboard when click outside textfield
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


<img src='http://i.imgur.com/1oVas4R.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
