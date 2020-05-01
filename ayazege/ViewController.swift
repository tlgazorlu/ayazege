//
//  ViewController.swift
//  ayazege
//
//  Created by tolga on 1.05.2020.
//  Copyright © 2020 tolga zorlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var ayazArray = [UIImageView]()
    var hideTimer = Timer()
    var hightScore = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hightscoreLabel: UILabel!
    @IBOutlet weak var ayaz1: UIImageView!
    @IBOutlet weak var ayaz2: UIImageView!
    @IBOutlet weak var ayaz3: UIImageView!
    @IBOutlet weak var ayaz4: UIImageView!
    @IBOutlet weak var ayaz5: UIImageView!
    @IBOutlet weak var ayaz6: UIImageView!
    @IBOutlet weak var ayaz7: UIImageView!
    @IBOutlet weak var ayaz8: UIImageView!
    @IBOutlet weak var ayaz9: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score : \(score)"
        
        // hightscore check
        
        let storeHightscore = UserDefaults.standard.object(forKey: "highscore")
        
        if storeHightscore == nil {
           
            hightScore = 0
            hightscoreLabel.text = "Hightscore: \(hightScore)"
            
        }
        
        if let newScore = storeHightscore as? Int {
            
            hightScore = newScore
            hightscoreLabel.text = "Hightscore: \(hightScore)"
            
        }
        
      
        
        
        ayaz1.isUserInteractionEnabled = true
        ayaz2.isUserInteractionEnabled = true
        ayaz3.isUserInteractionEnabled = true
        ayaz4.isUserInteractionEnabled = true
        ayaz5.isUserInteractionEnabled = true
        ayaz6.isUserInteractionEnabled = true
        ayaz7.isUserInteractionEnabled = true
        ayaz8.isUserInteractionEnabled = true
        ayaz9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))

        ayaz1.addGestureRecognizer(recognizer1)
        ayaz2.addGestureRecognizer(recognizer2)
        ayaz3.addGestureRecognizer(recognizer3)
        ayaz4.addGestureRecognizer(recognizer4)
        ayaz5.addGestureRecognizer(recognizer5)
        ayaz6.addGestureRecognizer(recognizer6)
        ayaz7.addGestureRecognizer(recognizer7)
        ayaz8.addGestureRecognizer(recognizer8)
        ayaz9.addGestureRecognizer(recognizer9)
        
        ayazArray = [ayaz1, ayaz2, ayaz3, ayaz4, ayaz5, ayaz6, ayaz7, ayaz8, ayaz9]
        
        
        
        
        counter = 10
        
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(coundDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideAyaz), userInfo: nil, repeats: true)
        
        hideAyaz()
        
    }
    
   @objc func hideAyaz() {
        
        for keny in ayazArray {
            
            keny.isHidden = true
            
        }
        
       let random = Int(arc4random_uniform(UInt32(ayazArray.count - 1)))
        ayazArray[random].isHidden = false
        
    }

    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score : \(score)"
        
        
        
    }
    
    @objc func coundDown() {
        
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            
            timer.invalidate()
            hideTimer.invalidate()
            
            for keny in ayazArray {
                
                keny.isHidden = true
                
            }
            
            //hightScore
            
            if self.score > self.hightScore {
                
                self.hightScore = self.score
                hightscoreLabel.text = "HightScore : \(self.hightScore)"
                UserDefaults.standard.set(self.hightScore, forKey: "highscore")
                 
                
            }
            
            //Alert
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
              // replay func
                
                self.score = 0
                self.scoreLabel.text = "Skore: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.coundDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideAyaz), userInfo: nil, repeats: true)
                
            }
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
              // replay func
                
                self.score = 0
                self.scoreLabel.text = "Skore: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.coundDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideAyaz), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
              
            
        }
        
    }

}


