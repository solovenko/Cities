//
//  ASEndGameController.swift
//  Cities
//
//  Created by Артем Соловьенко on 19.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//
import UIKit

let endViewFontSize: CGFloat = 14.0

class ASEndGameController: UIViewController {
    
    var winnerNameLabel: UILabel!
    var winnerScoreLabel: UILabel!
    
    var playAgainButton: UIButton!
//    var exitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerNameLabel = UILabel()
        winnerScoreLabel = UILabel()
        
        playAgainButton = UIButton()
//        exitButton = UIButton()
        
        winnerNameLabel.font = winnerNameLabel.font.fontWithSize(endViewFontSize + 2.0)
        winnerScoreLabel.font = winnerScoreLabel.font.fontWithSize(endViewFontSize)
        
        playAgainButton.setTitle("Начать заного", forState: UIControlState.Normal)
        playAgainButton.layer.backgroundColor = UIColor.blueColor().CGColor
        playAgainButton.layer.cornerRadius = cornerRadius
        playAgainButton.layer.borderWidth = borderWidth
        playAgainButton.titleLabel?.font = playAgainButton.titleLabel?.font.fontWithSize(endViewFontSize - 2.0)
        playAgainButton.addTarget(self, action: "playAgainButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
//        exitButton.setTitle("Выйти", forState: UIControlState.Normal)
//        exitButton.layer.backgroundColor = UIColor.blueColor().CGColor
//        exitButton.layer.cornerRadius = cornerRadius
//        exitButton.layer.borderWidth = borderWidth
//        exitButton.titleLabel?.font = exitButton.titleLabel?.font.fontWithSize(endViewFontSize - 2.0)
//        exitButton.addTarget(self, action: "exitButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(winnerNameLabel)
        view.addSubview(winnerScoreLabel)
        view.addSubview(playAgainButton)
//        view.addSubview(exitButton)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        
        if player1.score > player2.score {
            winnerNameLabel.text = "Победитель: \(player1.name)"
            winnerScoreLabel.text = "Набрано очков: \(player1.score)"
        } else {
            winnerNameLabel.text = "Победитель: \(player2.name)"
            winnerScoreLabel.text = "Набрано очков: \(player2.score)"

        }
        
        var size = winnerNameLabel.sizeThatFits(CGSizeZero)
        winnerNameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + distanceBetweenBodyElements, size.width, size.height)
        
        size = winnerScoreLabel.sizeThatFits(CGSizeZero)
        winnerScoreLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + distanceBetweenBodyElements * 3, size.width, size.height)
        
        size = playAgainButton.sizeThatFits(CGSizeZero)
        playAgainButton.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) * 5 / 6, size.width, size.height)
        
//        size = exitButton.sizeThatFits(CGSizeZero)
//        exitButton.frame = CGRectMake(
//            (view.bounds.width - size.width) / 2 + size.width,
//            (view.bounds.height - size.height) * 5 / 6, size.width, size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    func playAgainButtonTapped(sender: UIButton!) {
        
        performSegueWithIdentifier("toRepeatGameSegue", sender: self)
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
