//
//  pokemonTests.swift
//  pokemonTests
//
//  Created by Nancy Kim on 7/5/15.
//  Copyright (c) 2015 Nancy Kim. All rights reserved.
//

import UIKit
import XCTest

class pokemonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNewPokemonHealth() {
        var NewPokemon = Pokemon(type: "good")
        XCTAssertEqual(NewPokemon.health, 100, "New pokemon should have 100 health as default")
    }
    
    func testNewPokemonAttack() {
        var NewPokemon = Pokemon(type: "good")
        
        XCTAssertEqual(NewPokemon.attackPower, 20, "Default attack power is 20.")
    }
    
    func testAttacking() {
        var NewPokemon = Pokemon(type: "good")
        XCTAssertLessThanOrEqual(NewPokemon.attackSomeone(), 20,
            "should be less than 20")
    }
    
    func testWhoGoesFirst() {
        var newMatch = Match()
        
        if newMatch.turn == 1 {
            XCTAssertEqual(newMatch.turn, 1, "who goes first")
        }
        
    }
    
    func test_hit(){
        var newMatch = Match()
        
        if newMatch.turn == 1 {
            newMatch.fight()
            XCTAssertEqual(newMatch.turn, 0, "alternate turns")
        } else {
            newMatch.fight()
            XCTAssertEqual(newMatch.turn, 1, "alternate turns")
        }

    }
        
}









