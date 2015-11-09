//
//  ViewController.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-09.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var trivias = [Trivia]()
    
    //create an instance of our struct
    var triviaToronto = Trivia(name:"CN Tower",country:"Ontario",trivia:"Large Building")
    var triviaOttawa = Trivia(name: "Rideau Canal", country: "Ontario", trivia: "Great for skating")
    var triviaCalifornia = Trivia(name: "Orange County", country: "California", trivia: "Lots of oranges")
    var triviaComox  = Trivia(name: "HMCS Quadra", country: "British Columbia", trivia: "Very scary place")
    var triviaWinnipeg = Trivia(name: "Winterpeg", country: "Canada", trivia: "Cold is an understatement")
    var triviaUK = Trivia(name: "Britain", country: "UK", trivia: "Home to Dr. Who")
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trivias += [triviaToronto,triviaOttawa,triviaCalifornia,triviaComox,triviaWinnipeg,triviaUK]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivias.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //For non custom type cells:
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //cell.textLabel?.text = trivias[indexPath.row].name
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TriviaTableViewCell
        
        cell.triviaTitle.text = trivias[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //Define state before animation begins
        cell.alpha = 0.0
        // final state after animation
        UIView.animateWithDuration(1.0) { () -> Void in
            cell.alpha = 1.0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }


}

