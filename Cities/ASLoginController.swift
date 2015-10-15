//
//  ASLoginController.swift
//  Cities
//
//  Created by Артем Соловьенко on 15.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//

import UIKit

let myFontSize: CGFloat = 10.0


class ASLoginController: UIViewController {
    
    var player1NameLabel: UILabel!
    var player1NameText: UITextField!
    
    var player2NameLabel: UILabel!
    var player2NameText: UITextField!
    
    var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton = UIButton()
        
        player1NameLabel = UILabel()
        player1NameText = UITextField()
        player2NameLabel = UILabel()
        player2NameText = UITextField()
        
        submitButton.setTitle("OK", forState: UIControlState.Normal)
//        submitButton.titleLabel?.textColor = UIColor.blackColor()
        submitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submitButton.titleLabel?.font = submitButton.titleLabel?.font.fontWithSize(myFontSize)
        submitButton.enabled = true
        submitButton.layer.borderColor = UIColor.blueColor().CGColor
        submitButton.layer.borderWidth = 0.5
        submitButton.layer.cornerRadius = 5.0
        submitButton.layer.backgroundColor = UIColor.blueColor().CGColor
        submitButton.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        player1NameLabel.text = "Введите имя игрока 1:"
        player1NameLabel.font = player1NameLabel.font.fontWithSize(myFontSize)
        player1NameText.font = player1NameText.font!.fontWithSize(myFontSize)
        player1NameText.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        player2NameLabel.text = "Введите имя игрока 2:"
        player2NameLabel.font = player2NameLabel.font.fontWithSize(myFontSize)
        player2NameText.font = player2NameText.font!.fontWithSize(myFontSize)
        player2NameText.layer.backgroundColor = UIColor.whiteColor().CGColor
        
        view.addSubview(submitButton)
        view.addSubview(player1NameLabel)
        view.addSubview(player1NameText)
        view.addSubview(player2NameLabel)
        view.addSubview(player2NameText)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var size = submitButton.sizeThatFits(CGSizeZero)
        submitButton.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 2 + size.height * 3, size.width * 2, size.height)
        
        //Player 1
        size = player1NameLabel.sizeThatFits(CGSizeZero)
        player1NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 - size.width / 2,
            (view.bounds.height - size.height) / 2 - size.height, size.width, size.height)
        
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        size.width *= 0.75
        player1NameText.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 + size.width * 0.75,
            (view.bounds.height - size.height) / 2 - size.height, size.width, size.height)
        player1NameText.text = ""
        
        //Player 2
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        player2NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 - size.width / 2,
            (view.bounds.height - size.height) / 2 + size.height, size.width, size.height)
        
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        size.width *= 0.75
        player2NameText.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 + size.width * 0.75,
            (view.bounds.height - size.height) / 2 + size.height, size.width, size.height)
        player2NameText.text = ""
    }
    
    func isAllowToSegue(player1 player1Name: String?, player2 player2Name: String?) -> Bool {
        
        var result = false
        
        
        
        return result
    }
    
    
    // MARK: - Actions
    func buttonTapped(sender : UIButton!) {
        print("Ok Action!")
        
        var alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "Test alert";
        alertView.message = "Alert!";
        alertView.show();
//        sender.enabled = false
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
