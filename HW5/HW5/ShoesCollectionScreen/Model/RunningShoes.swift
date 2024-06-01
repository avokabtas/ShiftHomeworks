//
//  RunningShoes.swift
//  CollectionApp
//
//  Created by Aliia Satbakova  on 08.05.2024.
//

import Foundation

struct RunningShoes {
    let image: String
    let brand: String
    let model: String
    let type: RunningShoesType
    let bestFor: BestForType
    let price: String
    
    enum RunningShoesType: String, CaseIterable {
        case road = "Road"
        case roadRacing = "Road Racing"
        case trail = "Trail Running"
    }
    
    enum BestForType: String, CaseIterable {
        case everyday = "Everyday Runs"
        case longDistance = "10K, Half Marathons and Marathons"
        case racePaceShortDistance = "Mile, 5K and 10K Road Races"
        case racePaceLongDistance = "Half Marathons and Marathons at Race Pace"
        case trailRacing = "Trail Running and Trail Racing"
        case trailEveryday = "Trail Running and Hiking"
    }
}

extension RunningShoes {
    static let runningShoesData: [RunningShoes] = [
        RunningShoes(image: "winflo", brand: "Nike", model: "Winflo 11", type: .road, bestFor: .everyday, price: "$105"),
        RunningShoes(image: "pegasus", brand: "Nike", model: "Pegasus 40", type: .road, bestFor: .everyday, price: "$130"),
        RunningShoes(image: "vomero", brand: "Nike", model: "Vomero 17", type: .road, bestFor: .everyday, price: "$160"),
        RunningShoes(image: "invincible", brand: "Nike", model: "Invincible 3", type: .road, bestFor: .everyday, price: "$180"),
        RunningShoes(image: "infinityrn", brand: "Nike", model: "InfinityRN 4", type: .road, bestFor: .everyday, price: "$160"),
        RunningShoes(image: "vaporfly", brand: "Nike", model: "Vaporfly 3", type: .roadRacing, bestFor: .longDistance, price: "$260"),
        RunningShoes(image: "alphafly", brand: "Nike", model: "Alphafly 3", type: .roadRacing, bestFor: .racePaceLongDistance, price: "$285"),
        RunningShoes(image: "streakfly", brand: "Nike", model: "Streakfly", type: .roadRacing, bestFor: .racePaceShortDistance, price: "$170"),
        RunningShoes(image: "zegama", brand: "Nike", model: "Zegama 2", type: .trail, bestFor: .trailRacing, price: "$180"),
        RunningShoes(image: "pegasus-trail", brand: "Nike", model: "Pegasus Trail 5", type: .trail, bestFor: .trailEveryday, price: "$150")
    ]
}
