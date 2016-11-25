//
//  ViewController.swift
//  ShakeMe
//
//  Created by Terrell Robinson on 11/4/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameButton: UIButton!
    @IBOutlet weak var maracasImage: UIImageView!
    
    var timer = Timer()
    var countdownInt = 0
    var scoreInt = 0
    
    var shakeModeInt = 0
    
    var imageInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countdownInt = 10
        scoreInt = 0
        
        timerLabel.text = String(countdownInt)
        scoreLabel.text = String(scoreInt)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }

    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            
            if shakeModeInt == 1 {
                
                scoreInt += 1
                scoreLabel.text = String(scoreInt)
                
                imageInt += 1
                
                if imageInt == 5 {
                    
                    imageInt = 1 // Creates a constant loop
                    
                }
                
                maracasImage.image = UIImage(named: "Maracas\(imageInt).png")
                
            }
            
            
        }
        
    }
    
    @IBAction func gameButtonPressed(_ sender: AnyObject) {
        
        gameLogic()
        
    }
    
    
    // Helper Methods
    
    func startCounter() {
        
        countdownInt -= 1
        timerLabel.text = String(countdownInt)
        
        if countdownInt == 0 {
            
            timer.invalidate()
            
            gameButton.isEnabled = true
            gameButton.alpha = 1
            
            gameButton.setTitle("RESTART GAME", for: .normal)
            
            shakeModeInt = 0
            
        }
    }
    
    
    func gameLogic() {
        
        if countdownInt == 10 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.startCounter), userInfo: nil, repeats: true)
            
            gameButton.isEnabled = false
            gameButton.alpha = 0.5
            
            shakeModeInt = 1
            
        } else if countdownInt == 0 {
            
            scoreInt = 0
            countdownInt = 10
            
            timerLabel.text = String(countdownInt)
            scoreLabel.text = String(scoreInt)
            
            gameButton.setTitle("START GAME", for: .normal)
            
        }
        
        
    }
    
    
    
    
    

}

