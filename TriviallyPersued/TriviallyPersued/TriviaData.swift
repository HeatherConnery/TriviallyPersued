//
//  TriviaData.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-10.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class TriviaData: NSObject {
    
    var trivias = [Trivia]()
    
    //create an instance of our struct
    var trivia1 = Trivia(name:"CN Tower",country:"Toronto",trivia:"Yup, it's a very tall tower")
    var trivia2 = Trivia(name: "Casa Loma", country: "Toronto", trivia: "Don't touch anything")
    var trivia3 = Trivia(name: "Rogers Centre", country: "Toronto", trivia: "If you're into baseball")
    var trivia4  = Trivia(name: "ROM", country: "Toronto", trivia: "Dinosaurs")
    var trivia5 = Trivia(name: "Toronto Zoo", country: "Toronto", trivia: "Lions and Tigers and Bears, oh my")
    var trivia6 = Trivia(name: "AGO", country: "Toronto", trivia: "Where to go to contemplate 3 stripes on canvas")
    
    //Version from working with Jessica
    //var trivia1 = Trivia(name:"CN Tower",country:"Toronto",trivia:"Yup, it's a very tall tower", address: "301 Front Street W, Toronto")
    
    
    func triviaModel() -> [Trivia] {
        trivias += [trivia1,trivia2,trivia3,trivia4,trivia5,trivia6]
        //trivias += [trivia1]
        return trivias
    }
}
