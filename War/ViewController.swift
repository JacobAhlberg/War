//
//  ViewController.swift
//  War
//
//  Created by Jacob Ahlberg on 2017-08-22.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftCard: UIImageView!
    @IBOutlet weak var rightCard: UIImageView!
    @IBOutlet weak var dealBtn: UIButton!
    @IBOutlet weak var leftScore: UILabel!
    @IBOutlet weak var rightScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func dealBtnPressed(_ sender: Any) {
        
        let playerRandom: Int = Int(arc4random_uniform(13))
        let CPURandom: Int = Int(arc4random_uniform(13))
        
        let arrayList = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
        
        let playerCard = arrayList[playerRandom]
        let CPUCard = arrayList[CPURandom]
        
        leftCard.image = UIImage(named: playerCard)
        rightCard.image = UIImage (named: CPUCard)
        
        if playerRandom > CPURandom || playerRandom == 0 && CPURandom != 0{
//            playerScore += 1
        } else if playerRandom == CPURandom{
        } else{
//            CPUScore += 1
        }
        
        
    }
    
}

