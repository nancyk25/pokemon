//
//  ViewController.swift
//  pokemon
//
//  Created by Nancy Kim on 7/5/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func showEverything(){
        goodGuyPic.hidden = false
        goodGuyLabel.hidden = false
        vsText.hidden = false
        badGuyPic.hidden = false
        badGuyText.hidden = false
        fightButtonUi.hidden = false
        startButtonUi.hidden = true
    }

    var match = Match()
   
    @IBOutlet weak var startButtonUi: UIButton!
    @IBAction func startButton(sender: AnyObject) {
        showEverything()
    }
    
    @IBOutlet weak var goodGuyPic: UIImageView!
    @IBOutlet weak var goodGuyLabel: UILabel!

    @IBOutlet weak var vsText: UILabel!
    
    @IBOutlet weak var badGuyPic: UIImageView!
    @IBOutlet weak var badGuyText: UILabel!
    
    @IBOutlet weak var fightButtonUi: UIButton!
    @IBAction func fightButton(sender: AnyObject) {
        let goodHealth = match.good.health
        let badHealth = match.bad.health
        
        vsText.text = match.fight()
        
        goodGuyLabel.text = String(match.good.health)
        badGuyText.text = String(match.bad.health)
        
        badGuyText.text = checkDefeat(match.bad.health)
        goodGuyLabel.text = checkDefeat(match.good.health)
    }
    
    func checkDefeat(health: Int) -> String {
        if health <= 0 {
            return "Defeated!"
        } else {
            return "Health: \(health) "
        }
    }

    
    
    
    
}

