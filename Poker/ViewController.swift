//
//  ViewController.swift
//  Poker
//
//  Created by SHIH-YING PAN on 2019/1/21.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    
    var cards = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        for i in 0...51 {
            let suit = i / 13
            let number = i % 13 + 1
            let card: Card
            if suit == 0 {
                card = Card(numberParameter: number, suitParameter: "♠️")
            } else if suit == 1 {
                card = Card(numberParameter: number, suitParameter: "♥️")
            } else if suit == 2 {
                card = Card(numberParameter: number, suitParameter: "♦️")
            } else {
                card = Card(numberParameter: number, suitParameter: "♣️")
            }
            cards.append(card)
        }

    }
    
    func checkSpecilCard(card: Card, label: UILabel, imageView: UIImageView) {
        if card.number == 12 {
            label.text = "Q\n\(card.suit)"
            imageView.image = UIImage(named: "Q")
        } else if card.number == 11 {
            label.text = "K\n\(card.suit)"
            imageView.image = UIImage(named: "J")
        } else if card.number == 13 {
            label.text = "K\n\(card.suit)"
            imageView.image = UIImage(named: "K")
        } else if card.number == 1 {
            label.text = "A\n\(card.suit)"
            imageView.image = UIImage(named: "A")
        } else {
            label.text = "\(card.number)\n\(card.suit)"
            imageView.image = UIImage(named: "normal")

        }
    }

    @IBAction func play(_ sender: Any) {
        let topCard = cards.randomElement()!
        var bottomCard = cards.randomElement()!
        while topCard.number == bottomCard.number, topCard.suit == bottomCard.suit {
            
            bottomCard = cards.randomElement()!
            
        }
        
        checkSpecilCard(card: topCard, label: topLabel, imageView: topImageView)
        checkSpecilCard(card: bottomCard, label: bottomLabel, imageView: bottomImageView)
        
        
        
        if topCard.number > bottomCard.number {
            
            finalLabel.text = "電腦贏了"
            
        }else if topCard.number == bottomCard.number{
            
            if topCard.suit == "♠️"{
                finalLabel.text = "電腦贏了"
                
            }else if bottomCard.suit == "♠️"{
                
                finalLabel.text = "我贏了"
                
            }else if topCard.suit == "♥️" {
                
                finalLabel.text = "電腦贏了"
                
            } else if topCard.suit == "♦️"{
                
                if bottomCard.suit == "♥️"{
                    
                     finalLabel.text = "我贏了"
                }else{
                    
                    finalLabel.text = "電腦贏了"
                }
                
            }else {
                
                finalLabel.text = "我贏了"
            }
            
        }
        else {
            
            finalLabel.text = "我贏了"
            
        }
        
}
}
