//
//  Card.swift
//  Poker
//
//  Created by SHIH-YING PAN on 2019/1/21.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

class Card {
    let number: Int
    let suit: String
    init(numberParameter: Int, suitParameter: String) {
        number = numberParameter
        suit = suitParameter
    }
}
