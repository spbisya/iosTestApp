//
//  ViewControllerPannable.swift
//  TestApp
//
//  Created by gwa on 3/27/17.
//  Copyright © 2017 gwa. All rights reserved.
//
import UIKit

class ViewControllerPannable: UIViewController {
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction(_:)))
        view.addGestureRecognizer(panGestureRecognizer!)
    }
    
    func panGestureAction(_ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: view)
        if panGesture.state == .began {
            originalPosition = view.center
            currentPositionTouched = panGesture.location(in: view)
            self.view.alpha = 1
        } else if panGesture.state == .changed {
            view.frame.origin = CGPoint(
                x: 0,
                y: translation.y
            )
            self.view.alpha = 1-abs(0.01*(translation.y/(self.view.frame.size.height/100)))
        } else if panGesture.state == .ended {
            let velocity = panGesture.velocity(in: view)
            print(String(describing: velocity.y))
            if abs(velocity.y) >= 1500{
                UIView.animate(withDuration: 0.2
                    , animations: {
                        self.view.frame.origin = CGPoint(
                            x: self.view.frame.origin.x,
                            y: self.view.frame.size.height
                        )
                        self.view.alpha = 1
                    },
                      completion: { isCompleted in
                        if isCompleted{ self.dismiss(animated: true, completion: nil)}
                                    }
                )
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.center = self.originalPosition!
                    self.view.alpha = 1
                })
            }
        }
    }
}
