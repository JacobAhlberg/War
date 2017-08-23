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
    @IBOutlet weak var winnerName: UILabel!
    
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var visualBlurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gömmer blureffekten
        self.visualBlurView.isHidden = true
    }
    
    func animateIn(){
        self.view.addSubview(popUpView)
        popUpView.center = self.view.center
        
        popUpView.transform = CGAffineTransform.init(scaleX: 2, y: 3)
        popUpView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualBlurView.isHidden = false
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpView.alpha = 0
            self.visualBlurView.isHidden = true
        }) { (success:Bool) in
            self.popUpView.removeFromSuperview()
        }
    }
    
    
    var playerScore = 0
    var CPUScore = 0
    
    
    
    @IBAction func dealBtnPressed(_ sender: Any) {
        
        if playerScore == 0 && CPUScore == 0{
            self.timer()
        }
        
        let playerRandom: Int = Int(arc4random_uniform(13))
        let CPURandom: Int = Int(arc4random_uniform(13))
        
        let arrayList = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
        
        let playerCard = arrayList[playerRandom]
        let CPUCard = arrayList[CPURandom]
        
        leftCard.image = UIImage(named: playerCard)
        rightCard.image = UIImage (named: CPUCard)
        
        if playerRandom > CPURandom || playerRandom == 0 && CPURandom != 0{
            playerScore += 1
            leftScore.text = ("\(playerScore)")
        } else if playerRandom == CPURandom{
        } else{
            CPUScore += 1
            rightScore.text = ("\(CPUScore)")
        }
    }
    
    func timer(){
         _ = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.finishRound), userInfo: nil, repeats: false);
    }
    
    @objc func finishRound() {
        if playerScore > CPUScore{
            winnerName.text = "Player!"
        } else if (playerScore == CPUScore){
            winnerName.text = "Nobody!"
        } else{
            winnerName.text = "CPU!"
        }
        self.animateIn()
    }
    
    @IBAction func playAgainBtnPressed(_ sender: Any) {
        leftCard.image = UIImage(named: "back")
        rightCard.image = UIImage(named: "back")
        playerScore = 0
        CPUScore = 0
        leftScore.text = "\(playerScore)"
        rightScore.text = "\(CPUScore)"
        self.animateOut()
    }
    
}

