//
//  ASGameplayController.swift
//  Cities
//
//  Created by Артем Соловьенко on 15.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//

import UIKit

let gameViewFontSize: CGFloat = 14.0

class ASGameplayController: UIViewController {
    
    // Buttons
    var enterButton: UIButton!
    var skipButton: UIButton!
    var endButton: UIButton!
    
    // Player 1
    var player1NameLabel: UILabel!
    var player1ScoreLabel: UILabel!
    var player1SkipsLabel: UILabel!
    
    // Player 2
    var player2NameLabel: UILabel!
    var player2ScoreLabel: UILabel!
    var player2SkipsLabel: UILabel!
    
    // Skip counters
    var player1SkipCounter: UInt8 = 0
    var player2SkipCounter: UInt8 = 0
    
    // Game
    var listOfCitiesArray: [String]!
    var usedCitiesArray: [String]!
    var skipFlag: Bool = false
    
    var gamePreviousCityLabel: UILabel!
    var gameTipLetterLabel: UILabel!
    var gameInfoLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton = UIButton()
        
        player1NameLabel = UILabel()
        player1ScoreLabel = UILabel()
        player1SkipsLabel = UILabel()
        
        player2NameLabel = UILabel()
        player2ScoreLabel = UILabel()
        player2SkipsLabel = UILabel()
        
        gamePreviousCityLabel = UILabel()
        gameTipLetterLabel = UILabel()
        gameInfoLabel = UILabel()
        
        listOfCitiesArray = [""]
        usedCitiesArray = [""]
        
        enterButton.setTitle("Ввести", forState: UIControlState.Normal)
        enterButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        enterButton.titleLabel!.font = enterButton.titleLabel!.font.fontWithSize(gameViewFontSize)
        enterButton.enabled = true
        
        enterButton.layer.borderColor = UIColor.blueColor().CGColor
        enterButton.layer.borderWidth = 0.3
        enterButton.layer.cornerRadius = 8.0
        enterButton.layer.backgroundColor = UIColor.blueColor().CGColor
        enterButton.addTarget(self, action: "enterButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        view.addSubview(player1NameLabel)
        view.addSubview(player1ScoreLabel)
        view.addSubview(player1SkipsLabel)
        view.addSubview(player2NameLabel)
        view.addSubview(player2ScoreLabel)
        view.addSubview(player2SkipsLabel)
        view.addSubview(gamePreviousCityLabel)
        view.addSubview(gameTipLetterLabel)
        view.addSubview(gameInfoLabel)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        let alertView = UIAlertView();
//        alertView.addButtonWithTitle("Ok");
//        alertView.title = "Welcome!";
//        alertView.message = "Hello, \(player1.name) and \(player2.name)!";
//        alertView.show();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
