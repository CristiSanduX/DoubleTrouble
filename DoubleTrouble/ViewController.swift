//
//  ViewController.swift
//  DoubleTrouble
//
//  Created by Cristi Sandu on 12.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceArray = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    var dice = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for image in diceArray {
            dice.append(UIImage(named: image)!)
        }
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        animate(diceImageView: diceImageView1)
        animate(diceImageView: diceImageView2)
        
        let a = Int.random(in: 0...5)
        let b = Int.random(in: 0...5)
        
        diceImageView1.image = UIImage(named: diceArray[a])
        diceImageView2.image = UIImage(named: diceArray[b])
    }
    
    func animate(diceImageView: UIImageView) {
        diceImageView.animationImages = dice
        diceImageView.animationDuration = 0.5
        diceImageView.animationRepeatCount = 2
        diceImageView.startAnimating()
    }
    
}

