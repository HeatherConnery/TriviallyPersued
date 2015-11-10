//
//  TriviaData.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-10.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

struct TriviaData {
    
    var trivias = [Trivia]()
    
    //create an instance of our struct
    var triviaToronto = Trivia(name:"CN Tower",country:"Ontario",trivia:"Large Building")
    var triviaOttawa = Trivia(name: "Rideau Canal", country: "Ontario", trivia: "Great for skating")
    var triviaCalifornia = Trivia(name: "Orange County", country: "California", trivia: "Lots of oranges")
    var triviaComox  = Trivia(name: "HMCS Quadra", country: "British Columbia", trivia: "Very scary place")
    var triviaWinnipeg = Trivia(name: "Winterpeg", country: "Canada", trivia: "Cold is an understatement")
    var triviaUK = Trivia(name: "Britain", country: "UK", trivia: "Home to Dr. Who")
    
    
    mutating func triviaModel() -> [Trivia] {
        trivias += [triviaToronto,triviaOttawa,triviaCalifornia,triviaComox,triviaWinnipeg,triviaUK]
        return trivias
    }
}
