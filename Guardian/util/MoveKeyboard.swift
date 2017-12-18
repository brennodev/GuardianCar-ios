//
//  MoveKeyboard.swift
//  Guardian
//
//  Created by Brenno Hayden on 18/12/2017.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class MoveKeyboard {
    
    static func animateViewMoving(view: UIView, up: Bool, moveValue: CGFloat) {
        
        let movementDuration:TimeInterval = 0.3
        
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(movementDuration )
        
        view.frame = view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
    }
}
