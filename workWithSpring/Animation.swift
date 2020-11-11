//
//  Animation.swift
//  workWithSpring
//
//  Created by Даниил Никулин on 11.11.2020.
//

import Spring

struct Settings {
    
    var animation: String
    var curve : String
    var force : CGFloat
    
    static let animationsSet: Set = [
                                                "shake",
                                                "pop",
                                                "morph",
                                                "squeeze",
                                                "wobble",
                                                "swing",
                                                "flash"
    ]
    
    static let curves = [
                                "spring",
                                "linear",
                                "easeIn",
                                "easeOut",
                                "easeInOut"
    ]
    
    static func getRandomAnimations() -> [Settings] {
        
        var animations = [Settings]()
        
        let arrayWithAnimations = Array(animationsSet)

        for animation in arrayWithAnimations {
            let randomCurve = Int.random(in: 0...4)
            let randomForce = CGFloat(Int.random(in: 1...3))

            animations.append(Settings(animation: animation, curve: curves[randomCurve], force: randomForce))
        }
        
        return animations
    }
    
}
    



