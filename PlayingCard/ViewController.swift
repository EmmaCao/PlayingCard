//
//  ViewController.swift
//  PlayingCard
//
//  Created by xhand on 2018/11/9.
//  Copyright © 2018 EmmaCao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swip = UISwipeGestureRecognizer(target: self
                , action: #selector(nextCard))
            swip.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swip)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:break
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    var deck = PlayingCardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
    }

    
}

