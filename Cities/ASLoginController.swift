//
//  ASLoginController.swift
//  Cities
//
//  Created by Артем Соловьенко on 15.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//

import UIKit

let loginViewFontSize: CGFloat = 14.0

var player1: ASPlayer!
var player2: ASPlayer!

class ASLoginController: UIViewController {
    
    
    
    var player1NameLabel: UILabel!
    var player1NameText: UITextField!
    
    var player2NameLabel: UILabel!
    var player2NameText: UITextField!
    
    var submitButton: UIButton!
    
    // MARK: - Initialized before appear
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player1 = ASPlayer()
        player2 = ASPlayer()
        
        submitButton = UIButton()
        
        player1NameLabel = UILabel()
        player1NameText = UITextField()
        player2NameLabel = UILabel()
        player2NameText = UITextField()
        
        submitButton.setTitle("OK", forState: UIControlState.Normal)
        submitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submitButton.titleLabel!.font = submitButton.titleLabel!.font.fontWithSize(loginViewFontSize)
        submitButton.enabled = true
        
        submitButton.layer.borderColor = UIColor.blueColor().CGColor
        submitButton.layer.borderWidth = 0.5
        submitButton.layer.cornerRadius = 5.0
        submitButton.layer.backgroundColor = UIColor.blueColor().CGColor
        submitButton.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        player1NameLabel.text = "Введите имя игрока 1:"
        player1NameLabel.font = player1NameLabel.font.fontWithSize(loginViewFontSize)
        player1NameText.font = player1NameText.font!.fontWithSize(loginViewFontSize)
        player1NameText.layer.backgroundColor = UIColor.whiteColor().CGColor
        player1NameText.delegate = self
        
        player2NameLabel.text = "Введите имя игрока 2:"
        player2NameLabel.font = player2NameLabel.font.fontWithSize(loginViewFontSize)
        player2NameText.font = player2NameText.font!.fontWithSize(loginViewFontSize)
        player2NameText.layer.backgroundColor = UIColor.whiteColor().CGColor
        player2NameText.delegate = self
        
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
        
        // Elements on view about player 1
        size = player1NameLabel.sizeThatFits(CGSizeZero)
        player1NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 - size.width / 2,
            (view.bounds.height - size.height) / 2 - size.height, size.width, size.height)
        
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        size.width *= 0.75
        player1NameText.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 + size.width * 0.75,
            (view.bounds.height - size.height) / 2 - size.height, size.width, size.height)

        
        // Elements on view about player 2
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        player2NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 - size.width / 2,
            (view.bounds.height - size.height) / 2 + size.height, size.width, size.height)
        
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        size.width *= 0.75
        player2NameText.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 + size.width * 0.75,
            (view.bounds.height - size.height) / 2 + size.height, size.width, size.height)
    }
    
    // Checking to validity of name
    func isAllowToSegue(player1 player1Name: String?, player2 player2Name: String?) -> Bool {
        
        var isAllowToSegue = true
        
        if let name1 = player1Name where name1.characters.count > 2 {
            //If not nil
            player1NameLabel.text = "Привет, \(name1)"
        } else {
            isAllowToSegue = false
            player1NameLabel.text = "Некорректное имя игрока 1!"
        }
        
        if let name2 = player2Name where name2.characters.count > 2 {
            //If not nil
            player2NameLabel.text = "Привет, \(name2)"
        } else {
            isAllowToSegue = false
            player2NameLabel.text = "Некорректное имя игрока 2!"
        }
        
        if isAllowToSegue {
            
            player1.name = player1Name!
            player1.score = 0
            player1.skips = 0
            player2.name = player2Name!
            player2.score = 0
            player2.score = 0
        }
        
        return isAllowToSegue
    }
    
    // MARK: - Actions
    func buttonTapped(sender : UIButton!) {
        
        player1NameText.endEditing(true)
        player2NameText.endEditing(true)
        
        if isAllowToSegue(player1: player1NameText.text, player2: player2NameText.text){
            
            performSegueWithIdentifier("toGameWindowSegue", sender: self)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
//        let gameplayView: ASGameplayController = segue.destinationViewController
        
        if segue.identifier == "toGameWindowSegue" {
            var gameplayView = segue.destinationViewController as? ASGameplayController
        }
        
    }
}

// MARK: - Extension
extension ASLoginController: UITextFieldDelegate {
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        if let touch = touches.first as? UITouch {
//            view.endEditing(true)
//        }
//        super.touchesBegan(touches, withEvent: event)
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}