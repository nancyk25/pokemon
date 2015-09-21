//
//  Pokemon.swift
//  pokemon
//
//  Created by Nancy Kim on 7/5/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import Foundation
//
//Game has players
//Game has player types:
//Good guys
//Bad guys

//All players have 100 health to start with
//Default attack power to 20 points.

//Add different types of good guys and bad guys with their own special moves

//Make it so players can only attack the opposite type (good can only attack bad and vice versa)
//Attack status and player life is displayed on each attack.

//Bonus: Create a match class that starts a match and accepts a good  guy and a bad guy. Each player hits each other in turn until the other player is out of life.
//
//Bonus 2: Make it so each attack does a random amount of damage between 0 and 20. If the attack does 0 damage, give the players feedback that the attack was blocked (hint: arcrandom_uniform method).


class Pokemon {
    
    init(type: String) {
        self.type = type
    }
    
    var health:Int = 100
    var type: String
    var attackPower:Int = 20
    
    func attackSomeone() -> Int {        
        return Int(arc4random_uniform(20))
    }

}

class BadGuy: Pokemon {
    var specialMoves:[String] = ["Steal!", "Spit", "Acid burn"]
    var turn:Int = 0
}

class GoodGuy: Pokemon {
    var specialMoves:[String] = ["Haiduken", "Punch", "Roundhouse Kick!"]
    var turn:Int = 1
}

class Match {
    
    var good = GoodGuy(type: "good")
    var bad = BadGuy(type: "bad")
    var turn:Int = 0
    
    init(){
        playerGoesFirst()
    }
    
    func playerGoesFirst() -> String {
        if Int(arc4random_uniform(2)) == 1 {
            turn = 1
            return good.type
        } else {
            turn = 0
            return bad.type
        }
    }
    
    func fight() -> String {
        
        if turn == 1 {
            let damage = good.attackSomeone()
            if damage == 0 {
                return "Bad guy Blocked!"
            } else {
                bad.health -= damage
                turn = 0
                return generateFightSummary(good.type, damage: damage,
                    move: useRandomMove(good.specialMoves))
            }
        } else {
            let damage = bad.attackSomeone()
            if damage == 0 {
                return "Good guy Blocked!"
            } else {
                good.health -= damage
                turn = 1
                return generateFightSummary(bad.type, damage: damage,
                    move: useRandomMove(bad.specialMoves))
            }
        }
    }
    
    func generateFightSummary(who: String, damage: Int, move: String) -> String {
        return "\(who) guy damaged \(String( damage )) health with \(move)"
    }

    
    func useRandomMove(moves: [String]) -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(moves.count)))
        return moves[randomIndex]
    }
}






