//
//  ViewController.swift
//  workWithSpring
//
//  Created by Даниил Никулин on 10.11.2020.
//

import UIKit
import Spring

class ViewController: UIViewController {

    @IBOutlet var springView: SpringView!
    @IBOutlet var springButton: SpringButton!
    @IBOutlet var infoLabel: UILabel!
    
    let animations = Settings.getRandomAnimations()
    var currentAnimation = 0
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springButton.layer.cornerRadius = 10
        springView.layer.cornerRadius = 10
        
        setLabelText()
        
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    @IBAction func nextAnimationRun(_ sender: SpringButton) {

        springView.animation = animations[currentAnimation].animation
        springView.curve = animations[currentAnimation].curve
        springView.force = animations[currentAnimation].force
        
        springButton.animation = "pop"
        springButton.duration = 2
        springButton.animate()
        
        springView.animateNext(completion: {
            if self.currentAnimation == (self.animations.count - 1) {
                self.currentAnimation = 0
            }else {
                self.currentAnimation += 1
            }
            self.setLabelText()
            
        })
        
    }
}

extension ViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setLabelText()  {
        let nextDescription = "Следующая анимация:\n\(animations[currentAnimation].animation)\nХарактеристики:\nCurve: \(animations[currentAnimation].curve)\nForce: \(animations[currentAnimation].force)"
        
        infoLabel.text = nextDescription

    }
}

