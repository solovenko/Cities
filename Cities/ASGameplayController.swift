//
//  ASGameplayController.swift
//  Cities
//
//  Created by Артем Соловьенко on 15.10.15.
//  Copyright © 2015 Артем Соловьенко. All rights reserved.
//

import UIKit

class ASGameplayController: UIViewController {
    
    var players: (ASPlayer!,ASPlayer!)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var alertView = UIAlertView();
                        alertView.addButtonWithTitle("Ok");
                        alertView.title = "Welcome!";
                        alertView.message = "Hello, \(players.0) and \(players.1)!";
                        alertView.show();

        
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
