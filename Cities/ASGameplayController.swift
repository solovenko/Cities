//
//  ASGameplayController.swift
//  Cities
//
//  Created by Артем Соловьенко on 15.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//

import UIKit

let gameViewHeaderFontSize: CGFloat = 11.0
let gameViewBodyFontSize: CGFloat = 13.0

let borderWidth: CGFloat = 0.1
let cornerRadius: CGFloat = 7.0
let buttonFrameWidth: CGFloat = 85
let distanceBetweenBodyElements: CGFloat = 40

let permittedAmountOfSkips = 3

// MARK: - For the test
let citiesArray = ["Москва", "Барнаул", "Астрахань", "Нягань", "Липецк"]

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
    
//    // Skip counters
//    var player1SkipCounter: UInt8 = 0
//    var player2SkipCounter: UInt8 = 0
    
    // Game
    var currentTurn: ASTurnPlayer!
    
    var listOfCitiesArray: [String]!
    var usedCitiesArray: [String]!
    var skipFlag: Bool = false
    
    var gameTurnLabel: UILabel!
    var gamePreviousCityLabel: UILabel!
    var gameTipLetterLabel: UILabel!
    var gameInputFieldLabel: UILabel!
    var gameInfoLabel: UILabel!
    var gameInputCityTextField: UITextField!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startInitialization()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        let alertView = UIAlertView();
//        alertView.addButtonWithTitle("Ok");
//        alertView.title = "Welcome!";
//        alertView.message = "Hello, \(player1.name) and \(player2.name)!";
//        alertView.show();
        
        var size: CGSize // size of element
        
        // Elements on view about players (header's elements)
        
        player1NameLabel.text = player1.name
        size = player1NameLabel.sizeThatFits(CGSizeZero)
        player1NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 4 - size.width,
            (view.bounds.height - size.height) / 6 - size.height, size.width, size.height)
        
        player1ScoreLabel.text = "Очки: \(player1.score)"
        size = player1ScoreLabel.sizeThatFits(CGSizeZero)
        player1ScoreLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 4  - size.width * 0.87,
            (view.bounds.height - size.height) / 6 + size.height, size.width, size.height)
        
        player1SkipsLabel.text = "Пропуски: \(player1.skips) из \(permittedAmountOfSkips)"
        size = player1SkipsLabel.sizeThatFits(CGSizeZero)
        player1SkipsLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 4 - size.width / 4,
            (view.bounds.height - size.height) / 6 + size.height * 3, size.width, size.height)
        
        player2NameLabel.text = player2.name
        size = player2NameLabel.sizeThatFits(CGSizeZero)
        player2NameLabel.frame = CGRectMake(
            (view.bounds.width - size.width) * 3 / 4,
            (view.bounds.height - size.height) / 6 - size.height, size.width, size.height)
        
        player2ScoreLabel.text = "Очки: \(player2.score)"
        size = player2ScoreLabel.sizeThatFits(CGSizeZero)
        player2ScoreLabel.frame = CGRectMake(
            (view.bounds.width - size.width) * 3 / 4,
            (view.bounds.height - size.height) / 6 + size.height, size.width, size.height)
        
        player2SkipsLabel.text = "Пропуски: \(player2.skips) из \(permittedAmountOfSkips)"
        size = player2SkipsLabel.sizeThatFits(CGSizeZero)
        player2SkipsLabel.frame = CGRectMake(
            (view.bounds.width - size.width) * 3 / 4,
            (view.bounds.height - size.height) / 6 + size.height * 3, size.width, size.height)
        
        // Elements on view about game (body's elements)
        
        gameTurnLabel.text = "Ход: \(player1.name)"
        size = gameTurnLabel.sizeThatFits(CGSizeZero)
        gameTurnLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + distanceBetweenBodyElements, size.width, size.height)
        
        gamePreviousCityLabel.text = "Предыдущий город: Астрахань"
        size = gamePreviousCityLabel.sizeThatFits(CGSizeZero)
        gamePreviousCityLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + size.height * 2 + distanceBetweenBodyElements, size.width, size.height)
        
        gameTipLetterLabel.text = "Введите город России на букву: Н"
        size = gameTipLetterLabel.sizeThatFits(CGSizeZero)
        gameTipLetterLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + size.height * 4 + distanceBetweenBodyElements, size.width, size.height)
        
        gameInputFieldLabel.text = "Поле ввода:"
        size = gameInputFieldLabel.sizeThatFits(CGSizeZero)
        gameInputFieldLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 - size.width / 2,
            (view.bounds.height - size.height) / 3 + size.height * 6 + distanceBetweenBodyElements, size.width, size.height)
        
        gameInputCityTextField.text = ""
        size = gameInputFieldLabel.sizeThatFits(CGSizeZero)
        gameInputCityTextField.frame = CGRectMake(
            (view.bounds.width - size.width) / 2 + size.width * 0.6,
            (view.bounds.height - size.height) / 3 + size.height * 6 + distanceBetweenBodyElements, size.width + size.width / 4, size.height)
        
        gameInfoLabel.text = ""
        size = gameInfoLabel.sizeThatFits(CGSizeZero)
        gameInfoLabel.frame = CGRectMake(
            (view.bounds.width - size.width) / 2,
            (view.bounds.height - size.height) / 3 + size.height * 8 + distanceBetweenBodyElements, size.width, size.height)
        
        // Elements on view - buttons (footer's elements)
        
        size = enterButton.sizeThatFits(CGSizeZero)
        enterButton.frame = CGRectMake(
            (view.bounds.width - buttonFrameWidth) / 6 - buttonFrameWidth / 6,
            (view.bounds.height - size.height) * 5 / 6, buttonFrameWidth, size.height)
        
        size = skipButton.sizeThatFits(CGSizeZero)
        skipButton.frame = CGRectMake(
            (view.bounds.width - buttonFrameWidth) / 2,
            (view.bounds.height - size.height) * 5 / 6, buttonFrameWidth, size.height)
        
        size = endButton.sizeThatFits(CGSizeZero)
        endButton.frame = CGRectMake(
            (view.bounds.width - buttonFrameWidth) * 5 / 6 + buttonFrameWidth / 6,
            (view.bounds.height - size.height) * 5 / 6, buttonFrameWidth, size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    func startInitialization() {
        
        currentTurn = ASTurnPlayer.ASTurnPlayer1
        
        enterButton = UIButton()
        skipButton = UIButton()
        endButton = UIButton()
        
        player1NameLabel = UILabel()
        player1ScoreLabel = UILabel()
        player1SkipsLabel = UILabel()
        
        player2NameLabel = UILabel()
        player2ScoreLabel = UILabel()
        player2SkipsLabel = UILabel()
        
        gameTurnLabel = UILabel()
        gamePreviousCityLabel = UILabel()
        gameTipLetterLabel = UILabel()
        gameInputFieldLabel = UILabel()
        gameInfoLabel = UILabel()
        
        gameInputCityTextField = UITextField()
        
        listOfCitiesArray = [""]
        usedCitiesArray = [""]
        
        enterButton.setTitle("Ввести", forState: UIControlState.Normal)
        enterButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        enterButton.titleLabel!.font = enterButton.titleLabel!.font.fontWithSize(gameViewBodyFontSize)
        enterButton.enabled = true
        
        enterButton.layer.borderColor = UIColor.blueColor().CGColor
        enterButton.layer.borderWidth = borderWidth
        enterButton.layer.cornerRadius = cornerRadius
        enterButton.layer.backgroundColor = UIColor.blueColor().CGColor
        enterButton.addTarget(self, action: "enterButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        skipButton.setTitle("Пропустить", forState: UIControlState.Normal)
        skipButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        skipButton.titleLabel!.font = enterButton.titleLabel!.font.fontWithSize(gameViewBodyFontSize)
        skipButton.enabled = true
        
        skipButton.layer.borderColor = UIColor.blueColor().CGColor
        skipButton.layer.borderWidth = borderWidth
        skipButton.layer.cornerRadius = cornerRadius
        skipButton.layer.backgroundColor = UIColor.blueColor().CGColor
        skipButton.addTarget(self, action: "skipButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        endButton.setTitle("Завершить", forState: UIControlState.Normal)
        endButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        endButton.titleLabel!.font = enterButton.titleLabel!.font.fontWithSize(gameViewBodyFontSize)
        endButton.enabled = true
        
        endButton.layer.borderColor = UIColor.blueColor().CGColor
        endButton.layer.borderWidth = borderWidth
        endButton.layer.cornerRadius = cornerRadius
        endButton.layer.backgroundColor = UIColor.blueColor().CGColor
        endButton.addTarget(self, action: "endButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Edit header's elements
        
        player1NameLabel.font = player1NameLabel.font.fontWithSize(gameViewHeaderFontSize)
        player1ScoreLabel.font = player1ScoreLabel.font.fontWithSize(gameViewHeaderFontSize)
        player1SkipsLabel.font = player1SkipsLabel.font.fontWithSize(gameViewHeaderFontSize)
        
        player2NameLabel.font = player2NameLabel.font.fontWithSize(gameViewHeaderFontSize)
        player2ScoreLabel.font = player2ScoreLabel.font.fontWithSize(gameViewHeaderFontSize)
        player2SkipsLabel.font = player2SkipsLabel.font.fontWithSize(gameViewHeaderFontSize)
        
        // Edit body's elements
        
        gameTurnLabel.font = gameTurnLabel.font.fontWithSize(gameViewBodyFontSize)
        gamePreviousCityLabel.font = gamePreviousCityLabel.font.fontWithSize(gameViewBodyFontSize)
        gameTipLetterLabel.font = gameTipLetterLabel.font.fontWithSize(gameViewBodyFontSize)
        gameInputFieldLabel.font = gameInputFieldLabel.font.fontWithSize(gameViewBodyFontSize)
        gameInputCityTextField.font = gameInputFieldLabel.font.fontWithSize(gameViewBodyFontSize)
        gameInputCityTextField.backgroundColor = UIColor.whiteColor()
        gameInfoLabel.font = gameInfoLabel.font.fontWithSize(gameViewBodyFontSize)
        
        view.addSubview(enterButton)
        view.addSubview(skipButton)
        view.addSubview(endButton)
        view.addSubview(player1NameLabel)
        view.addSubview(player1ScoreLabel)
        view.addSubview(player1SkipsLabel)
        view.addSubview(player2NameLabel)
        view.addSubview(player2ScoreLabel)
        view.addSubview(player2SkipsLabel)
        view.addSubview(gameTurnLabel)
        view.addSubview(gamePreviousCityLabel)
        view.addSubview(gameTipLetterLabel)
        view.addSubview(gameInputFieldLabel)
        view.addSubview(gameInfoLabel)
        view.addSubview(gameInputCityTextField)
    }
    
    func update(){
        
        //Header's elements
        
        //Scores
        player1ScoreLabel.text = "Очки: \(player1.score)"
        player2ScoreLabel.text = "Очки: \(player2.score)"
        
        //Skips
        player1SkipsLabel.text = "Пропуски: \(player1.skips) из 5"
        player2SkipsLabel.text = "Пропуски: \(player2.skips) из 5"
        
        //Turn
        switch currentTurn! {
        case .ASTurnPlayer1: gameTurnLabel.text = "Ход: \(player1.name)"
        case .ASTurnPlayer2: gameTurnLabel.text = "Ход: \(player2.name)"
        }
        
        if skipFlag {
            
            gameInfoLabel.text = "Предыдущий игрок пропустил ход. \nВведите новое название города"
            
            //Show name of previous city
            if usedCitiesArray != nil && usedCitiesArray.count > 0 {
                gamePreviousCityLabel.text = "Предыдущий город: \(usedCitiesArray.last)"
                gameTipLetterLabel.text = "Введите город России на любую букву"
                gameTipLetterLabel.textColor = UIColor.redColor()
            }
            
        } else {
            
            // Clear system tip
            gameInfoLabel.text = ""
            
            if usedCitiesArray != nil && usedCitiesArray.count > 0 {
                gamePreviousCityLabel.text = "Предыдущий город: \(usedCitiesArray.last)"
                
                //Check out letters: "ъ", "ь", "й"
                
                var lastLetter: Character = (usedCitiesArray.last?.characters.last)!
                var index = usedCitiesArray.last!.endIndex.successor()
                
                if lastLetter == "ъ" || lastLetter == "ь" || lastLetter == "й" {
                    lastLetter = usedCitiesArray.last![index]
                }
                
                gameTipLetterLabel.text = "Введите город России на букву: \(String(lastLetter))"
                gameTipLetterLabel.textColor = UIColor.blackColor()
            }
        }
    }
    
    func gameLogic(enteredCity: String?) -> Bool {
        
        
        var isSuccessful = false
        var isFinden = false
        
        var resultString: String = ""
        
        for element in listOfCitiesArray {
            var length: UInt8 = UInt8(element.characters.count)
            
            if length > 1 && element.lowercaseString == enteredCity?.lowercaseString {
                isFinden = true
                resultString = element
            }
        }
        
        if !isFinden {
            
            gameInfoLabel.text = "Такого города не существует! \nПовторите попытку"
        } else {
            
            var isUsed = false
            
            for element in usedCitiesArray {
                
                if element.lowercaseString == enteredCity?.lowercaseString {
                    isUsed = true
                    break
                }
            }
            
            if isUsed {
                
                gameInfoLabel.text = "Такой город уже был назван! \nПовторите попытку"
                
            } else {
                
                if skipFlag {
                    
                    usedCitiesArray.append(resultString)
                    isSuccessful = true
                    addBonus()
                    
                } else if usedCitiesArray.count > 0 {
                        
                    var firstLetterInEnterredWord: Character = resultString.lowercaseString.characters.first!
                    var lastLetterInUsedWord: Character = (usedCitiesArray.last?.characters.last!)!
                    var index = usedCitiesArray.last!.endIndex.successor()
                    
                    if lastLetterInUsedWord == "ъ" || lastLetterInUsedWord == "ь" || lastLetterInUsedWord == "й" {
                        
                        lastLetterInUsedWord = usedCitiesArray.last!.lowercaseString[index]
                            
                    }
                        
                    if firstLetterInEnterredWord == lastLetterInUsedWord {
                            
                        usedCitiesArray.append(resultString)
                        isSuccessful = true
                        addBonus()
                            
                    } else {
                            
                        gameInfoLabel.text = "Ошибка! Введённое название города не начинается с буквы, \nуказанной в конце предыдущего слова!"
                            
                    }
                } else {
                    
                    //If cities did not be used
                    usedCitiesArray.append(resultString)
                    isSuccessful = true
                    addBonus()
                }
            }
        }
        return isSuccessful
    }
    
    func nextTurn(turn: ASTurnPlayer) {
        
        switch turn {
        case .ASTurnPlayer1: currentTurn = .ASTurnPlayer2
        case .ASTurnPlayer2: currentTurn = .ASTurnPlayer1
        }
    }

    
    func addBonus() {
        switch currentTurn! {
        case .ASTurnPlayer1: player1.score++
        case .ASTurnPlayer2: player2.score++
        }
    }
    
    // MARK: - Actions
    
    func enterButtonTapped(sender : UIButton!) {
        
        if let enterredNameOfCity = gameInputCityTextField.text {
            
            if gameLogic(enterredNameOfCity) {
                nextTurn(currentTurn)
                skipFlag = false
                update()
            }
        }
    }
    
    func skipButtonTapped(sender : UIButton!) {
        
        skipFlag = true
        switch currentTurn! {
        case .ASTurnPlayer1:
            ++player1.skips
            if player1.skips > UInt8(permittedAmountOfSkips - 1) {
                performSegueWithIdentifier("toEndGameWindowSegue", sender: self)
            }
        case .ASTurnPlayer2:
            ++player2.skips
            if player2.skips > UInt8(permittedAmountOfSkips - 1) {
                performSegueWithIdentifier("toEndGameWindowSegue", sender: self)
            }
        }
        nextTurn(currentTurn)
        update()
    }
    
    func endButtonTapped(sender : UIButton!) {
        
//        var alert: UIAlert = [[NSAlert alloc] init];
//        [alert addButtonWithTitle:@"Нет"];
//        [alert addButtonWithTitle:@"Да"];
//        [alert setMessageText:@"Вы действительно хотите закончить игру?"];
//        [alert setInformativeText:@"Подведение итогов игры произойдёт по текущим результатам!"];
//        [alert setAlertStyle:NSWarningAlertStyle];
        
        let alertController = UIAlertController(
            title: "Вы действительно хотите закончить игру?",
            message: "Подведение итогов игры произойдёт по текущим результатам!",
            preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "Да", style: .Default, handler: nil)
        let cancelAction = UIAlertAction(title: "Нет", style: .Cancel, handler: nil)
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
//        let alertView = UIAlertView();
//        alertView.addButtonWithTitle("Ok");
//        alertView.title = "Welcome!";
//        alertView.message = "Hello, \(player1.name) and \(player2.name)!";
//        alertView.show();
        
        //Переопределение нажатия клавиш на кнопки
        //Для кнопки "Нет"
        
        
//        UIButton *button  = [[alert buttons]objectAtIndex:0];
//        [button setKeyEquivalent:@""];
//        //Для кнопки "Да"
//        button  = [[alert buttons]objectAtIndex:1];
//        [button setKeyEquivalent:@"\r"];
//        
//        if ([alert runModal] == NSAlertSecondButtonReturn) {
//            [self doSegue:@"toEndGameWindowSegue"];
//        }
        
//        let button: UIButton = alertView.

    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
