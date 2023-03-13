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
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    
    let diceArray = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    var dice = [UIImage]()
    
    var number = 0   // Jocul se va termina dupa ce fiecare jucator va arunca de 3 ori
    
    var score1 = 0   // Actualizarea scorului dupa fiecare aruncare a player-ului
    var score2 = 0
    
    var message = "" // Mesajul final in care se precizeaza player-ul castigator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for image in diceArray {
            dice.append(UIImage(named: image)!)
        }
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        number += 1
        
        // Setam flag-ul pentru a astepta sfarsitul animatiei
        diceImageView1.isAnimating ? (diceImageView1.tag = 1) : (diceImageView1.tag = 0)
        diceImageView2.isAnimating ? (diceImageView2.tag = 1) : (diceImageView2.tag = 0)
        
        animate(diceImageView: diceImageView1)
        animate(diceImageView: diceImageView2)
        
        let a = Int.random(in: 0...5)
        let b = Int.random(in: 0...5)
        
        if (number % 2 == 1) {
            score1 += a+b+2
        } else {
            score2 += a+b+2
        }
        
        diceImageView1.image = UIImage(named: diceArray[a])
        diceImageView2.image = UIImage(named: diceArray[b])
        
        if (number == 6) {
            if (score1 > score2) {
                message = "Player1 a castigat!"
            } else if (score2 > score1) {
                message = "Player2 a castigat!"
            } else {
                message = "Egalitate!"
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + diceImageView1.animationDuration) {
                if self.diceImageView1.tag == 0 && self.diceImageView2.tag == 0 {
                    
                    let alertController = UIAlertController(title: "Jocul s-a incheiat", message: self.message, preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "Reia jocul", style: .default) { _ in
                        self.player1TextField.text = "0"
                        self.player2TextField.text = "0"
                        self.number = 0; self.score1 = 0; self.score2 = 0
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func updateTextField() {
        player1TextField.text = "\(score1)"
        player2TextField.text = "\(score2)"
    }
    
    func animate(diceImageView: UIImageView) {
        diceImageView.animationImages = dice
        diceImageView.animationDuration = 0.5
        diceImageView.animationRepeatCount = 1
        diceImageView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + diceImageView.animationDuration) {
            if self.diceImageView1.tag == 0 && self.diceImageView2.tag == 0 {
                self.updateTextField()
            }
        }
    }
}
