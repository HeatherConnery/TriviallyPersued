//
//  ViewController.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-09.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var triviaData  = TriviaData().triviaModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//       trivias += [triviaToronto,triviaOttawa,triviaCalifornia,triviaComox,triviaWinnipeg,triviaUK]
       //let trivias = triviaData.triviaModel()
        //print("\(trivias)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return triviaData.count
        
       
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //For non custom type cells:
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //cell.textLabel?.text = trivias[indexPath.row].name
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TriviaTableViewCell
        
        cell.triviaTitle.text = triviaData[indexPath.row].name
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

